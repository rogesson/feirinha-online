### Documentação Feirinha-Online-API

Documentação oficial da API do projeto Feirinha Online.

Essa documentação será atualizada e no final desse arquivo estará a data de cada alteração feita nela.

***

### Utilização de token nas requisições

Para a maioria das requisições, a API espera receber um Token de autenticação que será enviado no HEADER da requisição.
Esse Token precisa seguir o padrão abaixo, ele é conseguido apenas no retorno da resposta de login efetuado com sucesso, para mais informações sobre o login, consulte a sessão *usuário#login* abaixo.

As requisições que precisam de Token, vão estar devidamente marcadas em negrito nessa documentação, com a informação "**Token no Header***".

Algumas URLs ainda estão em desenvolvimento, iremos atualizando o documento conforme andamento do projeto, incluindo e alterando conforme melhorias combinadas entre o time da API e o time Front-End.


    { authentication-token: "VokFx2yxzh7WbQ4c_J7N" }

***

## Rotas



## Perfil (Role)

Em construção

## Usuários
  **Criação de usuário**
  *URL:** https://feirinha-api.herokuapp.com/api/v1/signup

  Method: POST
    Descrição: Essa rota é responsável por criar um novo usuário,

    Parâmetros de Envio:

      {
        "user": {
          "name": "rogesson",
          "email": "rogessonb@gmail.com",
          "password": "123912391@@28",
          "password_confirmation": "123912391@@28",
          "doc_number": "19616825089"
        }
      }

Retorno:

      {
        "message": "Conta criada com sucesso!",
        "is_success": true,
        "data": {
            "user": {
                "id": 1,
                "name": "rogesson",
                "created_at": "2020-05-08T22:03:01.424Z",
                "updated_at": "2020-05-08T22:03:01.424Z",
                "email": "rogessonb@gmail.com",
                "authentication_token": "VokFx2yxzh7WbQ4c_J7N",
                "doc_number": "196.168.250-89"
            }
        }
      }


    Login de usuário
    URL: https://feirinha-api.herokuapp.com/api/v1/login
    Method: POST
    Parâmetros de Envio:

      {
        "user": {
          "email": "rogessonb@gmail.com",
          "password": "123912391@@28"
        }
      }

Retorno:

    {
      "message": "Bem vindo!",
      "is_success": true,
      "data": {
          "user": {
              "id": 1,
              "name": "rogesson",
              "email": "rogessonb@gmail.com"
              "authentication_token": "VokFx2yxzh7WbQ4c_J7N"
          }
      }
    }

***

# Categorias

Em construção - Favor utilizar o category_id número 1 por enquanto para criar lojas.

***

# Lojas

    Criação de loja
    URL: https://feirinha-api.herokuapp.com/api/v1/stores
    Method: **POST**
    **Token no Header***
    Parâmetros de Envio:

    {
      "store": {
        "name": "Store 3",
        "category_id": 1,
        "phone_number": "(19) 9999-9999",
        "image_url": "http://anystring.com"
      }
    }

Retorno:

    {
        "message": "Loja criada!",
        "is_success": true,
        "data": {
            "store": {
                "id": 2,
                "name": "Store 3",
                "phone_number": "(19) 9999-9999",
                "image_url": "http://anystring.com",
                "category": {
                    "id": 1,
                    "name": "Alimentos"
                },
                "user": {
                    "id": 1,
                    "name": "Teste"
                },
                "products": []
            }
        }
    }


    Listagem de lojas
    URL: https://feirinha-api.herokuapp.com/api/v1/stores
    Method: **GET**
    **Token no Header***
    Retorno:

    {
        "message": "Todas as lojas",
        "is_success": true,
        "data": {
            "stores": [
                {
                    "id": 2,
                    "name": "Store 3",
                    "phone_number": "(19) 9999-9999",
                    "image_url": "http://anystring.com",
                    "category": {
                        "id": 1,
                        "name": "Alimentos"
                    },
                    "user": {
                        "id": 1,
                        "name": "Teste"
                    },
                    "products": []
                }
            ]
        }
    }

    Exibir uma loja específica
    URL: https://feirinha-api.herokuapp.com/api/v1/stores/1
    Method: **GET**
    **Token no Header***
    Resposta:

    {
        "message": "Loja encontrada",
        "is_success": true,
        "data": {
            "store": {
                "id": 2,
                "name": "Store 3",
                "phone_number": "(19) 9999-9999",
                "image_url": "http://anystring.com",
                "category": {
                    "id": 1,
                    "name": "Alimentos"
                },
                "user": {
                    "id": 1,
                    "name": "Teste"
                },
                "products": []
            }
        }
    }

    Editar uma loja
    URL: https://feirinha-api.herokuapp.com/api/v1/stores/1
    Method: **PUT ou PATCH**
    **Token no Header***

Parâmetros de envio:

    {
      "store": {
        "name": "Change name",
        "phone_number": "(19) 8888-8888",
        "image_url": "http://changestring"
      }
    }


Retorno:

    {
        "message": "Sua loja foi atualizada",
        "is_success": true,
        "data": {
            "store": {
                "id": 1,
                "name": "Change name",
                "phone_number": "(19) 8888-8888",
                "image_url": "http://changestring",
                "category": {
                    "id": 1,
                    "name": "Alimentos"
                },
                "user": {
                    "id": 1,
                    "name": "Teste"
                },
                "products": []
            }
        }
    }

***

# Produtos

    Criação de Produtos

    URL: https://feirinha-api.herokuapp.com/api/v1/stores/1/products
    Method: **POST**
    **Token no Header**
  **OBS:** Na URL o número da loja deve ser passado no lugar de **store_id**: /store/**store_id**/products

    Parâmetros de Envio:

    {
      "product": {
        "name": "Bolo de Morango",
        "price": 15.99,
        "description": "descrição",
        "image_url": "http://urldeimagem.com"
      }
    }

    Retorno:

    {
      "message": "Produto inserido!",
      "is_success": true,
      "data": {
        "product": {
          "name": "Bolo de Morango",
          "price": 15.99,
          "description": "descrição",
          "image_url": "http://urldeimagem.com",
          "store": {
            "id": 1,
            "name": "Store 3"
          }
        }
      }
    }

    Informações do Produto:

    URL: https://feirinha-api.herokuapp.com/api/v1/stores/1/products/1
    Method: **GET**
    **Token no Header**
**OBS:** Na URL o número da loja deve ser passado no lugar de **store_id** e o id do produto no **product_id**: /store/**store_id**/products/**product_id**

  Retorno:

    {
      "message": "Visualizar produto",
      "is_success": true,
      "data": {
          "product": {
              "name": "Bolo de Morango",
              "price": 15.99,
              "description": "descrição",
              "image_url": "http://urldeimagem.com",
              "store": {
                  "id": 1,
                  "name": "Store 3"
              }
          }
      }
    }

    Atualização do Produto

    URL: https://feirinha-api.herokuapp.com/api/v1/stores/1/products
    Method: **PUT ou PATCH**
    **Token no Header**
  **OBS:** Na URL o número da loja deve ser passado no lugar de **store_id**: /store/**store_id**/products

    Parâmetros de Envio:

    {
      "product": {
        "name": "Cenoura",
        "price": 3.99,
        "description": "descrição",
        "image_url": "http://urldeimagem.com"
      }
    }

    Retorno:
    {
        "message": "Produto atualizado",
        "is_success": true,
        "data": {
            "product": {
                "name": "Cenoura",
                "price": 3.99,
                "description": "descrição",
                "image_url": "http://urldeimagem.com",
                "store": {
                    "id": 1,
                    "name": "Store 3"
                }
            }
        }
    }

    Deleção do Produto:

    URL: https://feirinha-api.herokuapp.com/api/v1/stores/1/products/1
    Method: **DELETE*
    **Token no Header**
**OBS:** Na URL o número da loja deve ser passado no lugar de **store_id** e o id do produto no **product_id**: /store/**store_id**/products/**product_id**

    Retorno:

    {
        "message": "Produto excluído",
        "is_success": true,
        "data": {}
    }

***

# Histórico de alterações na API

- 08/05/2020 - Criação da documentação. Por: Rogesson

- 11/05/2020 - Remoção de 'role_id' dos parâmetros de envio em Criação de Usuário. Por: Hugo

- 11/05/2020 - Remoção de 'role_id' e 'role_name' no retorno de Login de Usuário. Por: Hugo

- 11/05/2020 - Inclusão de 'authentication_token' nos retorno de Login de Usuário. Por: Hugo

- 12/05/2020 - Inclusão de 'doc_number' nos parâmetros de envio em Criação de Usuário. Por: Hugo

- 14/05/2020 - Inclusão de 'phone_number' e 'image_url' nos parâmetros de envio em Criação de Loja. Por: Hugo

- 14/05/2020 - Inclusão de 'phone_number' e 'image_url' no retorno de Criação de Loja. Por: Hugo

- 16/05/2020 - Criação dos testes para as rotas CRUD (CREATE, UPDATE, READ, DELETE) do produto. Por: Rogesson

- 17/05/2020 - Inclusão de 'description' e 'image_url' nos parâmetros de envio/retorno de Produtos. Por: Hugo
