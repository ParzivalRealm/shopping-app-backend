class Api::V1::ProductsController < Api::V1::BaseController
    def index
        render json: {hello:"world"}
    end
end