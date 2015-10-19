require 'grape'
require 'json'

class API < Grape::API
  version 'v1', using: :path
  format :json

  helpers do

    def all_products
      [
        {id: 1, name: "Erlang Book"},
        {id: 2, name: "The Rails Way"},
        {id: 3, name: "Go Handbook"},
        {id: 4, name: "CI works"}
      ]
    end

  end

  resource :products do
    desc 'Returns all products.'
    get do
      all_products
    end

    desc 'Returns a single product.'
    params do
      requires :id, type: Integer, desc: 'Status id.'
    end
    route_param :id do
      get do
        product = all_products.find { |p| p[:id] == params[:id]}
        error!(404, "not found") unless product
        product
      end
    end

  end
end
