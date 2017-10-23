# README


* Rails version: 5.1.4

* Database creation/initialization:

rails db:create &&
rails db:migrate

There's a default books list. To fill the db with them type:

rails db:seed

* Usage:
bundle install &&
rails s

Open browser and type localhost:3000 or in a browser in local ethernet device type <ip>:3000 to open the application

* Example of config file to config ordenation params:

```javascript
[
  {
    "field":"edition_year",
    "direction":"desc"
  },
  {
    "field":"author",
    "direction":"desc"
  },
  {
    "field":"title",
    "direction":"asc"
  }
]
```

* Project decisions

As a regular Rails application I started to think about resources. After identified then I started to create them as well as the tables for persistence;

The ordenation file is used to create the Configuration model object. So it's possible to have how many types of ordenations I want. In Book index it's possible to select a Configuration label and click sort then the books will sort according to ordenations inputed on Configuration with a file;

I used cookies for client persistence so the client can memorize the last configuration to ordenation;


* Decisões de projeto

Como uma aplicação Rails Eu comecei a pensar nos recursos. Depois de identificá-los então eu comecei a criá-los bem como as tabelas para persistência;

O arquivo de ordenação é usado para criar o objeto de modelo Configuration. Então é possível ter quantas configurações quiser. Na página dos livros é possível selecionar uma Configuração e clicar em "sort" então os livros irão ser ordenados de acordo com as ordenações dadas de entrada na Configuration através de um arquivo;

Eu usei cookies para persistência no cliente então o cliente pode memorizar a última configuração para ordenar;