Dado('que o usuario consulte informacoes de produto') do
  @get_url = "https://api.restful-api.dev/objects"
end

Quando('ele realizar a pesquisa') do
  @list_product = HTTParty.get(@get_url)
end

Entao('uma lista de produtos deve retornar') do
  expect(@list_product.code).to eql 200
  expect(@list_product.message).to eql "OK"
end

Dado('que o usuario consulte informacoes de produto que nao existe') do
  @get_url_9999 = "https://api.restful-api.dev/objects/9999"
end

Quando('ele realizar a pesquisa de um produto inexistente') do
  @list_product = HTTParty.get(@get_url_9999)
end

Entao('deve mostrar um erro de produto nao encontrado') do
  expect(@list_product.code).to eql 404
  expect(@list_product.message).to eql 'Not Found'
  expect(@list_product['error']).to eql 'Oject with id=9999 was not found.'
end

Dado('que o usuario deseja incluir um produto') do
  @post_url = "https://api.restful-api.dev/objects"
end

Quando('ele realizar a requisicao') do
  @post_product = HTTParty.post(@post_url, :headers => {"Content-Type": "application/json"}, body: {
   "name": "Apple MacBook Pro 16",
   "data": {
      "year": 2019,
      "price": 1849.99,
      "CPU model": "Intel Core i9",
      "Hard disk size": "1 TB"
   }
  }.to_json)
end

Entao('deve cadastrar um novo produto') do
  @data = @post_product["data"]
  expect(@post_product.code).to eql 200
  expect(@post_product.message).to eql 'OK'
  expect(@post_product["name"]).to eql 'Apple MacBook Pro 16'
  expect(@data["year"]).to eql 2019
  expect(@data["price"]).to eql 1849.99
  expect(@data["CPU model"]).to eql 'Intel Core i9'
  expect(@data["Hard disk size"]).to eql '1 TB'
end

Dado('que o usuario deseja alterar um produto') do
  @put_url = 'https://api.restful-api.dev/objects/ff8081819782e69e0199a5313fce2156'
end

Quando('ele realizar a requisicao de alteracao de produto') do
  @put_product = HTTParty.put(@put_url, :headers => {"Content-Type": "application/json"}, body: {
   "name": "Apple MacBook Pro 16",
   "data": {
      "year": 2019,
      "price": 2049.99,
      "CPU model": "Intel Core i9",
      "Hard disk size": "1 TB",
      "color": "silver"
   }
  }.to_json)
end

Entao('deve alterar um novo produto com sucesso') do
  @data = @put_product['data']
  expect(@put_product.code).to eql 200
  expect(@put_product.message).to eql 'OK'
  expect(@put_product['id']).to eql 'ff8081819782e69e0199a5313fce2156'
  expect(@put_product['name']).to eql "Apple MacBook Pro 16"
  expect(@data['year']).to eql 2019
  expect(@data['price']).to eql 2049.99
  expect(@data['CPU model']).to eql "Intel Core i9"
  expect(@data['Hard disk size']).to eql "1 TB"
  expect(@data['color']).to eql "silver"
end

Dado('que o usuario deseja alterar um produto inexistente') do
  @put_url_not_exist = 'https://api.restful-api.dev/objects/ff8081819782e69e0199a5313fce2151'
end

Quando('ele realizar a requisicao de alteracao de produto inexistente') do
  @put_product_not_exist = HTTParty.put(@put_url_not_exist, :headers => {"Content-Type": "application/json"}, body: {
   "name": "Apple MacBook Pro 16",
   "data": {
      "year": 2019,
      "price": 2049.99,
      "CPU model": "Intel Core i9",
      "Hard disk size": "1 TB",
      "color": "silver"
   }
  }.to_json)
end

Entao('deve mostrar um erro de produto nao existe') do
  expect(@put_product_not_exist.code).to eql 404
  expect(@put_product_not_exist.message).to eql 'Not Found'
  expect(@put_product_not_exist['error']).to eql "The Object with id = ff8081819782e69e0199a5313fce2151 doesn't exist. Please provide an object id which exists or generate a new Object using POST request and capture the id of it to use it as part of PUT request after that."
end