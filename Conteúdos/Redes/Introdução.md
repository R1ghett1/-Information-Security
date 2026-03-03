# Introdução a Redes

### Rede de Computadores

Todos os computadores conectados a uma rede que participam diretamente na comunicação de rede são classificados como hosts. Os hosts podem enviar e receber mensagens na rede. Nas redes modernas, um host pode atuar como cliente, servidor ou ambos. O software instalado no computador determina qual função o computador desempenha.

Servidores são hosts que tem um software instalado que os permite fornecer informações, como e-mail ou páginas web, a outros hosts presentes na rede. Cada serviço exige um software separado. Por exemplo, um servidor exige um software de servidor Web para fornecer serviços à rede. Cada destino que o usuário acessa on-line é fornecido por um servidor localidado em algum lugar da rede conectada à internet global.

Clientes são computadores hosts que têm um software instalado que os permite solicitar e exibir as informações obtidas em um servidor. Um exemplo de software cliente é um navegador web.

Uma rede de computadores pode ser definida como a comunicação entre um ou mais dispositivos.

Host -> Nome atribuído ao computador na rede.
Servidor -> Fornece algum serviço de rede.
Client -> Consome algum serviço de um ou mais servidores.

---

### Protocolos

Garantem que diferentes computadores usando diferentes hardwares e softwares se comuniquem entre si.

Ex.: TCP-IP, UDP ...

A comunicação só ocorre pois existe um protocolo, no qual ambos os lados compreendem as informações.

---

### Endereços Lógicos

Os endereços lógicos são normalmente chamados de Endereço IP, na qual é formado por 4 octetos de forma decimal. 
Existem várias classificações de IP e cada uma serve para definir o uso em uma rede de acordo com a necessidade.

Ex.: 10.0.2.15 - Sendo o 15 a identificação do host perante outros dispositivos.

---

### Roteamento

Redes podem ser diferentes entre si, e somente conseguirem se enxergar através de roteamento de rede. 
Sendo necessária a presença de um Gateway. Gateway pode ser definido como um conversor de protocolos entre diferentes redes.

---

### Portas

Existem ao total um intervalo de 0 à 65535 portas, nas quais são utilizadas normalmente pelos protocolos TCP e UDP.
Um serviço normalmente tem sua porta padrão, porém essa configuração pode ser alterada pelo administrador do serviço, dependendo da sua configuração.

Existe um nome para a combinação de um endereço lógico com uma porta, sendo chamado de SOCKET.

---

### Conclusão 

Em todas as redes, temos ao minimo dois dispositivos com diferentes hardwares e softwares se comunicando através de uma rede de computadores. 
Sendo possível entre si, somente pela padronização dos protocolos. Se a conexão for entre duas redes diferentes, é necessária a presença de um gateway,
na qual garante que duas redes distintas possam se interagir e "se entender".

