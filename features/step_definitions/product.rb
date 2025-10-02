Dado('que o usuario consulte informacoes de produto') do
  @get_url = "https://api.restful-api.dev/objects"
end

Quando('ele realizar a pesquisa') do
  @list_employee = HTTParty.get(@get_url)
end

Entao('uma lista de produtos deve retornar') do
  expect(@list_employee.code).to eql 200
  expect(@list_employee.message).to eql "OK"
end

Dado('que o usuario consulte informacoes de produto que nao existe') do
  @get_url_9999 = "https://api.restful-api.dev/objects/9999"
end

Quando('ele realizar a pesquisa de um produto inexistente') do
  @list_employee = HTTParty.get(@get_url_9999)
end

Entao('deve mostrar um erro de produto nao encontrado') do
  expect(@list_employee.code).to eql 404
  expect(@list_employee.message).to eql 'Not Found'
  expect(@list_employee['error']).to eql 'Oject with id=9999 was not found.'
end

Dado('que o usuario deseja incluir um produto') do
  @post_url = "https://api.restful-api.dev/objects"
end

Quando('ele realizar a requisicao') do
  @post_employee = HTTParty.post(@post_url, :headers => {"Content-Type": "application/json"}, body: {
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
  @data = @post_employee["data"]
  expect(@post_employee.code).to eql 200
  expect(@post_employee.message).to eql 'OK'
  expect(@post_employee["name"]).to eql 'Apple MacBook Pro 16'
  expect(@data["year"]).to eql 2019
  expect(@data["price"]).to eql 1849.99
  expect(@data["CPU model"]).to eql 'Intel Core i9'
  expect(@data["Hard disk size"]).to eql '1 TB'
end