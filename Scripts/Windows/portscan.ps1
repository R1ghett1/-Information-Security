#Criando PortScan com PowerShell 

#Definição do Host 
$target_host = Read-Host "`nQual o Host desejado para realizar o PortScan?"

#Definição da Escolha do Usuário
$choice = read-host "Digite 1 Para definir as Portas que deseja verficar `nDigite 2 Para selecionar a busca por uma sequencia determinada de portas`nDigite 3 para realizar a sequencia completa de portas
Qual sua escolha: "

#Se a escolha for 1 -> 
if ($choice -eq 1) {

$top_ports = read-host "Digite as portas da seguinte forma: 22,80,3333,4334`n"

#Captura a resposta do usuário utilizando split para dividir a resposta em pedaços menores delimitados pela , resultando em um array
$ports_to_scan = $top_ports.Split(',') | ForEach-Object { [int]$_ }

#Caso nao seja digitado
if (!$ports_to_scan) {
    echo "Formato Invalido, favor tentar novamente."
} 
#Caso esteja correto a sequência 
else {
    foreach ($target_port in $ports_to_scan) {
        #Comando utilizado para testar conexão na porta definida, exclui respostas desnecessárias e retorne algo simples
        if (Test-NetConnection $target_host -Port $target_port -WarningAction SilentlyContinue -InformationLevel Quiet) {
            echo "$target_port - Porta Aberta"
        }
      }
   }
}

#Usuário define a sequencia por intervalos
elseif ($choice -eq 2) {
    
    $ports_sequence_start = read-host "Digite o primeiro numero da sequencia: "
    $ports_sequence_finish = read-host "Digite o ultimo numero da sequencia: "

    foreach ($target_port_sequence in $ports_sequence_start .. $ports_sequence_finish) {
        if (Test-NetConnection $target_host -Port $target_port_sequence -WarningAction SilentlyContinue -InformationLevel Quiet) {
            echo "$target_port_sequence - Porta Aberta"
        }
    }
}

 
#Se a escolha for 3 -> 
else {
foreach ($port in 1..65535) {

    if (Test-NetConnection $target_host -Port $port -WarningAction SilentlyContinue -InformationLevel Quiet) {
        echo "$port - Porta Aberta"
    }}else {
        echo "$port - Porta Fechada"
    }
}

