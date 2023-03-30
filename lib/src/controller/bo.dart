import 'package:flutter/material.dart';

/// BO == Business Objects
/// Here we got functions, widgets or whatever we want to help
// getstatusCode() is a function that give us info about http response
// we give it the status code and returns its meaning
String getstatusCode(int statusCode) {
  String result;
  String ri = 'Resposta Informativa:';
  String rs = 'Resposta Satisfatória:';
  String redireccion = 'Redirecionamento:';
  String ec = 'Erro de cliente:';
  String es = 'Erro de servidor:';

  switch (statusCode) {
    case 100:
      {
        result =
            '$ri Tudo Ok. Você deve continuar com a solicitação ou ignorá-la se estiver concluída';
      }
      break;
    case 101:
      {
        result = '$ri Solicitação de ATUALIZAÇÃO aceita.';
      }
      break;
    case 102:
      {
        result = '$ri Processando a solicitação.';
      }
      break;
    case 200:
      {
        result = '$rs A solicitação foi bem-sucedida.';
      }
      break;
    case 201:
      {
        result =
            '$rs A solicitação foi bem-sucedida e um novo recurso foi criado como resultado. Normalmente, essa é a resposta enviada após uma solicitação PUT.';
      }
      break;
    case 202:
      {
        result =
            '$rs A solicitação foi recebida, mas nenhuma ação foi tomada ainda. É uma requisição "No Commit", o que significa que não há como no HTTP permitir o envio de uma resposta assíncrona indicando o resultado do processamento da requisição. Destina-se a casos em que outro processo ou servidor processa a solicitação ou para processamento em lote.';
      }
      break;
    case 203:
      {
        result =
            '$rs A solicitação foi concluída com sucesso, mas seu conteúdo não foi obtido da fonte originalmente solicitada, mas foi coletado de uma cópia local ou de terceiros. Exceto esta condição, uma resposta 200 OK deve ser preferida em vez desta resposta.';
      }
      break;
    case 204:
      {
        result =
            '$rs A solicitação foi concluída com sucesso, mas sua resposta não tem conteúdo, embora os cabeçalhos possam ser úteis. O agente do usuário pode atualizar seus cabeçalhos em cache para este recurso com os novos valores.';
      }
      break;
    case 205:
      {
        result =
            '$rs A requisição foi finalizada com sucesso, porém sua resposta não tem conteúdo e também o user agent tem que inicializar a página de onde a requisição foi feita, este código é útil por exemplo para páginas com formulários cujo conteúdo deve ser limpo depois para o usuário enviar.';
      }
      break;
    case 206:
      {
        result =
            '$rs A solicitação servirá parcialmente o conteúdo solicitado. Esse recurso é usado por ferramentas de download como o wget para continuar a transferência de downloads interrompidos anteriormente ou para dividir um download e processar as partes simultaneamente.';
      }
      break;
    case 207:
      {
        result =
            '$rs Uma resposta de vários status transmite informações sobre vários recursos em situações em que vários códigos de status podem ser apropriados. O corpo da solicitação é uma mensagem XML.';
      }
      break;
    case 208:
      {
        result =
            '$rs A listagem de elementos DAV já foi notificada anteriormente, portanto não serão listados novamente.';
      }
      break;
    case 226:
      {
        result =
            '$rs O servidor atendeu a uma solicitação GET para o recurso e a resposta é uma representação do resultado de uma ou mais manipulações de instância aplicadas à instância atual.';
      }
      break;
    case 300:
      {
        result =
            '$redireccion Esta solicitação tem mais de uma resposta possível. User-Agent ou o usuário deve escolher um deles. Não há uma maneira padronizada de selecionar uma das respostas.';
      }
      break;
    case 301:
      {
        result =
            '$redireccion Esse código de resposta significa que o URI do recurso solicitado foi alterado. Um novo URI provavelmente será retornado na resposta.';
      }
      break;
    case 302:
      {
        result =
            '$redireccion Esse código de resposta significa que o recurso de URI solicitado foi alterado temporariamente. Novas alterações de URI serão adicionadas no futuro. Portanto, a mesma URI deve ser utilizada pelo cliente em requisições futuras.';
      }
      break;
    case 303:
      {
        result =
            '$redireccion O servidor envia esta resposta para direcionar o cliente a um novo recurso solicitado em outro endereço usando uma solicitação GET.';
      }
      break;
    case 304:
      {
        result =
            '$redireccion Isso é usado para fins de "caching". Indica ao cliente que a resposta não foi modificada. O cliente pode então continuar usando a mesma versão armazenada em seu cache.';
      }
      break;
    case 305:
      {
        result =
            '$redireccion Foi definido em uma versão anterior da especificação do protocolo HTTP para indicar que uma resposta solicitada deve ser acessada de um proxy. Foi preterido devido a questões de segurança associadas à configuração de um proxy.';
      }
      break;
    case 306:
      {
        result =
            '$redireccion Este código de resposta não é mais usado. No momento está reservado. Foi usado em versões anteriores da especificação HTTP1.1.';
      }
      break;
    case 307:
      {
        result =
            '$redireccion O servidor envia esta resposta para direcionar o cliente a obter o recurso solicitado para outro URI com o mesmo método da solicitação anterior. Tem a mesma semântica do código de resposta HTTP 302 Found, com a exceção de que o agente do usuário não deve alterar o método HTTP usado: se um POST foi usado na primeira solicitação, outro POST deve ser usado na segunda solicitação.';
      }
      break;
    case 308:
      {
        result =
            '$redireccion Isso significa que o recurso agora está permanentemente localizado em outro URI, especificado pela localização: resposta do cabeçalho HTTP. Tem a mesma semântica do código de resposta HTTP 301 Moved Permanently, com a exceção de que o agente do usuário não deve alterar o método HTTP usado: se um POST foi usado na primeira solicitação, outro POST deve ser usado na segunda solicitação.';
      }
      break;
    case 400:
      {
        result =
            '$ec Essa resposta significa que o servidor não conseguiu interpretar a solicitação devido à sintaxe inválida.';
      }
      break;
    case 401:
      {
        result =
            '$ec A autenticação é necessária para obter a resposta solicitada. Isso é semelhante ao 403, mas, neste caso, a autenticação é possível.';
      }
      break;
    case 402:
      {
        result =
            '$ec Este código de resposta é reservado para uso futuro. O objetivo inicial da criação desse código era para ser utilizado em sistemas de pagamento digital. No entanto, não está sendo usado atualmente.';
      }
      break;
    case 403:
      {
        result =
            '$ec O cliente não possui as permissões necessárias para determinado conteúdo, portanto o servidor se recusa a conceder uma resposta adequada.';
      }
      break;
    case 404:
      {
        result =
            '$ec O servidor não encontrou o conteúdo solicitado. Este código de resposta é um dos mais famosos devido à sua alta ocorrência na web.';
      }
      break;
    case 405:
      {
        result =
            '$ec O método solicitado é conhecido pelo servidor, mas foi desativado e não pode ser usado. Os dois métodos obrigatórios, GET e HEAD, nunca devem ser desabilitados e não devem retornar este código de erro.';
      }
      break;
    case 406:
      {
        result =
            '$ec Esta resposta é enviada quando o servidor, após aplicar uma negociação de conteúdo dirigida ao servidor, não encontra nenhum conteúdo que corresponda aos critérios fornecidos pelo usuário.';
      }
      break;
    case 407:
      {
        result =
            '$ec Isso é semelhante ao código 401, mas a autenticação deve ser feita por meio de um proxy.';
      }
      break;
    case 408:
      {
        result =
            '$ec Essa resposta é enviada em uma conexão ociosa em alguns servidores, mesmo sem nenhuma solicitação prévia do cliente. Isso significa que o servidor deseja desconectar esta conexão não utilizada. Essa resposta é amplamente utilizada, pois alguns navegadores, como Chrome, Firefox 27+ ou IE9, utilizam mecanismos de pré-conexão HTTP para agilizar a navegação. Lembre-se também de que alguns servidores simplesmente desconectam a conexão sem enviar esta mensagem.';
      }
      break;
    case 409:
      {
        result =
            '$ec Essa resposta pode ser enviada quando uma solicitação entra em conflito com o estado atual do servidor.';
      }
      break;
    case 410:
      {
        result =
            '$ec Esta resposta pode ser enviada quando o conteúdo solicitado foi excluído do servidor.';
      }
      break;
    case 411:
      {
        result =
            '$ec O servidor rejeita a solicitação porque o campo de cabeçalho Content-Length não está definido e o servidor o requer.';
      }
      break;
    case 412:
      {
        result =
            '$ec O cliente indicou pré-condições em seus cabeçalhos que o servidor não atende.';
      }
      break;
    case 413:
      {
        result =
            '$ec A entidade de solicitação é maior que os limites definidos pelo servidor; o servidor pode fechar a conexão ou retornar um campo de cabeçalho Retry-After.';
      }
      break;
    case 414:
      {
        result =
            '$ec O URI solicitado pelo cliente é mais longo do que o servidor está disposto a interpretar.';
      }
      break;
    case 415:
      {
        result =
            '$ec O formato multimídia dos dados solicitados não é suportado pelo servidor, portanto o servidor rejeita a solicitação.';
      }
      break;
    case 416:
      {
        result =
            '$ec O intervalo especificado pelo campo de cabeçalho Intervalo na solicitação não corresponde; é possível que o intervalo esteja fora do tamanho de dados de destino do URI.';
      }
      break;
    case 4017:
      {
        result =
            '$ec Isso significa que a expectativa indicada pelo campo de cabeçalho Expect solicitado não pode ser atendida pelo servidor.';
      }
      break;
    case 4018:
      {
        result = '$ec O garçom se recusa a tentar fazer café com chaleira.';
      }
      break;
    case 421:
      {
        result =
            '$ec A solicitação foi direcionada a um servidor que não é capaz de produzir uma resposta. Isso pode ser enviado por um servidor que não está configurado para produzir respostas devido à combinação de esquema e autoridade incluídos no URI solicitado.';
      }
      break;
    case 422:
      {
        result =
            '$ec A solicitação foi bem formada, mas não pôde ser atendida devido a erros semânticos.';
      }
      break;
    case 423:
      {
        result = '$ec O recurso que está sendo acessado está bloqueado.';
      }
      break;
    case 424:
      {
        result =
            '$ec A solicitação falhou devido a uma falha em uma solicitação anterior.';
      }
      break;
    case 426:
      {
        result =
            '$ec O servidor se recusa a aplicar a solicitação usando o protocolo atual, mas pode estar disposto a fazê-lo depois que o cliente atualizar para um protocolo diferente. O servidor envia um cabeçalho Upgrade em resposta para indicar os protocolos necessários.';
      }
      break;
    case 428:
      {
        result =
            '$ec O servidor de origem exige que a solicitação seja condicional. Destina-se a evitar problemas de "atualização perdida", onde um cliente OBTEM um estado de recurso, modifica-o e COLOCA-O de volta no servidor, enquanto um terceiro modificou o estado do servidor, levando a um conflito.';
      }
      break;
    case 429:
      {
        result =
            '$ec O usuário enviou muitas solicitações em um determinado período de tempo.';
      }
      break;
    case 431:
      {
        result =
            '$ec O servidor não está disposto a processar a solicitação porque os campos de cabeçalho são muito longos. A solicitação PODE ser recarregada depois de reduzir o tamanho dos campos de cabeçalho solicitados.';
      }
      break;
    case 451:
      {
        result =
            '$ec O usuário solicita um recurso ilegal, como algum site censurado por algum governo.';
      }
      break;
    case 500:
      {
        result =
            '$es O servidor encontrou uma situação que não sabe como lidar.';
      }
      break;
    case 501:
      {
        result =
            '$es O método solicitado não é suportado pelo servidor e não pode ser manipulado. Os únicos métodos que os servidores requerem suporte (e, portanto, não devem retornar este código) são GET e HEAD.';
      }
      break;
    case 502:
      {
        result =
            '$es Esta respuesta de error significa que el servidor, mientras trabaja como una puerta de enlace para obtener una respuesta necesaria para manejar la petición, obtuvo una respuesta inválida.';
      }
      break;
    case 503:
      {
        result =
            '$es O servidor não está pronto para lidar com a solicitação. Causas comuns podem ser que o servidor esteja fora do ar para manutenção ou sobrecarregado. Observe que junto com esta resposta, uma página amigável explicando o problema deve ser enviada. Essas respostas devem ser usadas para condições temporárias e o cabeçalho Retry-After: HTTP deve, se possível, conter o tempo estimado antes da recuperação do serviço. O webmaster também deve cuidar dos cabeçalhos relacionados ao cache que são enviados junto com essa resposta, pois essas respostas de condição temporária geralmente não devem ser armazenadas em cache.';
      }
      break;
    case 504:
      {
        result =
            '$es Essa resposta de erro é fornecida quando o servidor está atuando como um gateway e não consegue obter uma resposta a tempo.';
      }
      break;
    case 505:
      {
        result =
            '$es A versão HTTP usada na solicitação não é suportada pelo servidor.';
      }
      break;
    case 506:
      {
        result =
            '$es O servidor tem um erro de configuração interna: a negociação de conteúdo transparente para a solicitação resulta em uma referência circular.';
      }
      break;
    case 507:
      {
        result =
            '$es O servidor tem um erro de configuração interna: a variável de recurso escolhida está configurada para envolver a própria negociação de conteúdo transparente e, portanto, não é um ponto de extremidade adequado para o processo de negociação.';
      }
      break;
    case 508:
      {
        result =
            '$es O servidor encontrou um loop infinito ao processar a solicitação.';
      }
      break;
    case 510:
      {
        result =
            '$es Extensões adicionais para a solicitação são necessárias para o servidor atender.';
      }
      break;
    case 511:
      {
        result =
            '$es O código de status 511 indica que o cliente precisa se autenticar para obter acesso à rede.';
      }
      break;
  }
  return 'Status $statusCode => $result';
}

Widget textfield(String labeltext, TextEditingController controller,
    {bool obscureText, bool validate, bool outlineBorder = false}) {
  InputDecoration inputDecoration;
  if (validate != null && outlineBorder == false) {
    inputDecoration = InputDecoration(
      labelText: labeltext,
      errorText: validate ? null : 'Field can\'t be empty',
    );
  } else if (validate != null && outlineBorder == true) {
    inputDecoration = InputDecoration(
      labelText: labeltext,
      border: OutlineInputBorder(),
      errorText: validate ? null : 'Field can\'t be empty',
    );
  } else if (validate == null && outlineBorder == false) {
    inputDecoration = InputDecoration(
      labelText: labeltext,
    );
  } else {
    inputDecoration = InputDecoration(
      labelText: labeltext,
      border: OutlineInputBorder(),
    );
  }
  return TextField(
    obscureText: obscureText,
    decoration: inputDecoration,
    controller: controller,
  );
}

bool isNullOrEmpty(String string) {
  if (string.isEmpty || string == '' || string == null) {
    return true;
  } else {
    return false;
  }
}

Widget raisedButton(String buttonText,
    {Function onPressed, double fontSize = 12.0, double height, double width}) {
  if (onPressed == null) {
    onPressed = () {};
  }
  return Container(
      height: height,
      width: width,
      child: InkWell(
        child: ElevatedButton(
            child: Text(
              buttonText,
              style: TextStyle(fontSize: fontSize),
            ),
            onPressed: onPressed),
      ));
}

void openActionDialog(BuildContext context, String dialogTitle,
    String dialogContent, String actionButtonText, Function actionOnPressed) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: new Text(dialogTitle),
          content: new Text(dialogContent),
          actions: <Widget>[
            new TextButton(
                onPressed: actionOnPressed, child: new Text(actionButtonText)),
            new TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: new Text('Back'))
          ],
        );
      });
}
