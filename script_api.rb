#Crear Item

productos = [ 
{"title":"Producto de Prueba", "list_price":420, "sku":"PRO40PRO", "ean"=>"07852236842"} ,
{"title":"Producto de Prueba", "list_price":420, "sku":"PRO50PRO", "ean"=>"07852236843"}
]

url_final ="https://fulfillment.marketful.mx/items/create_item"
header = { "Authorization" => "q_bpeKV7Kgwhilp64FH0yQ", "User"=>"9QEqyWrC5YyK9TfwyllMVw"}
parametros = {"items"=>productos}
response = HTTParty.post("#{url_final}", :query => parametros, :headers =>header) 


# Borrar item

url_final = "https://fulfillment.marketful.mx/items/delete_item"
header = { "Authorization" => "q_bpeKV7Kgwhilp64FH0yQ", "User"=>"9QEqyWrC5YyK9TfwyllMVw"}
parametros = {"item_id"=> 140731}
response = HTTParty.post("#{url_final}", :query => parametros, :headers =>header) 

# Actualizar Item

url_final = "https://fulfillment.marketful.mx/items/update_item"
header = { "Authorization" => "q_bpeKV7Kgwhilp64FH0yQ", "User"=>"9QEqyWrC5YyK9TfwyllMVw"}
parametros = {"item_id"=> 140730, "title"=>"Producto de Prueba 2", "ean"=>"0786521521"}
response = HTTParty.post("#{url_final}", :query => parametros, :headers =>header) 

#consultar stock de items

url_final = "https://fulfillment.marketful.mx/items/get_stock"
header = { "Authorization" => "q_bpeKV7Kgwhilp64FH0yQ", "User"=>"9QEqyWrC5YyK9TfwyllMVw"}
parametros = {"sku"=>"PRO10PRO"}
response = HTTParty.get("#{url_final}", :query => parametros, :headers =>header)


# Generar Entrada

entry_order = {"PRO20PRO"=>"5", "PRO10PRO"=>50}

url_final = "https://fulfillment.marketful.mx/entradas/nueva_entrada_api"
header = { "Authorization" => "q_bpeKV7Kgwhilp64FH0yQ", "User"=>"9QEqyWrC5YyK9TfwyllMVw"}
parametros = {"entry_order"=>entry_order}
response = HTTParty.post("#{url_final}", :query => parametros, :headers =>header)



# consultar Orden

url_api = "https://fulfillment.marketful.mx/shopi_orders/get_orders"

header = { "Authorization" => "q_bpeKV7Kgwhilp64FH0yQ", "User"=>"9QEqyWrC5YyK9TfwyllMVw"}

parametros = {canal: 'Shopify', orden: '#1203' }

response = HTTParty.get("#{url_api}", :query => parametros, :headers =>header)



# Generar Orden

contact_info = {
"num_orden" => 12333534,
"orden_id" => 23423342354,
"customer" => "Charlie Hebdo",
"carrier_name" => "Fedex",
"telefono" => "4497893345",
"calle" => "Madero",
"no_exterior" => "34",
"no_interior" => "",
"colonia" => "Centro",
"ciudad" => "Aguascalientes",
"estado" => "MX - AG",
"codigo_postal" => "20290",
"canal" => "Liverpool",
"tipo_envio" => "economico", ## economico, dia_siguiente
"asegurado" => false
}
items = [
{"sku"=>"PRO10PRO", "cantidad"=>2},
{"sku"=>"PRO20PRO", "cantidad"=>3}
]
url_base = 'https://fulfillment.marketful.mx/shopi_orders/multicanal_api'
header = { "Authorization" => "q_bpeKV7Kgwhilp64FH0yQ", "User"=>"9QEqyWrC5YyK9TfwyllMVw"}
parametros = {
"order"=>{
"contact_info" => contact_info,
"items" => items
}
}
response = HTTParty.post("#{url_base}", :query =>
parametros, :headers =>header)