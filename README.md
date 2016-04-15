Programa	de	linha	de	comando	em	Ruby	capaz	de	calcular	o	valor	final	de
um	pedido	em	um	e-commerce.

## Requisitos

* Ruby 2.3
* Rake


## Como usar

### Ambiente Linux

Permitir execução do script (como su):

    $ chmod u+x app

Uma pequena ajuda... ;)

    $ ./app -h

Executar a aplicação (informar a opção -t caso queira rodar testes unitários antes).

    $ ./app -t coupons.csv products.csv orders.csv order_items.csv totals.csv

**IMPORTANTE! Manter a ordem dos arquivos CSV.**
