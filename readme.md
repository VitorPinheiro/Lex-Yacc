# Executar o Lex/Yacc via Docker

Dockerfile para criar uma imagem docker que gera um container Ubuntu que já contém uma instalação do Lex/Yacc.

## Como usar

Primeiro construa a sua imagem docker a partir do Dockerfile: lex-yacc-img.dockerfile

```bash
docker build -f lex-yacc-img.dockerfile -t lexyacc .
```

Para executar a imagem digite este comando:

```bash
docker run -ti --rm lexyacc /bin/bash
```

O comando acima já vai executar a imagem gerando um container acessivel via bash.

Repare que na pasta /tmp do seu container vai ter o conteudo da pasta files que estava na mesma pasta que o Dockerfile na hora da criacao da imagem do container.

Caso vc queria mapear um volume do seu PC, alem de copiar a pasta files, vc pode ao invés de executar o comando acima, rodar esse comando:
```bash
docker run -v  path-pasta-host:path-pasta-no-container -ti --rm lexyacc /bin/bash
```

Esse comando mapea uma pasta do seu host para o seu container. No caso do comando acima, ele mapea a pasta "path-pasta-host" do host para a pasta "path-pasta-no-container" do container. Essa situação é indicada caso você prefira ir editando o arquivo (lex/yacc) já com o container rodando.
