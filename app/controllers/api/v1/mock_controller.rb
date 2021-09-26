class Api::V1::MockController < ApplicationController
  def index
    render json: {
      coba: 'coba'
    }
  end

  def create
    expect_code = params['status_code']
    expect_body = params['body']

    render json: expect_body, :status => expect_code
  rescue ActionDispatch::Http::Parameters::ParseError => e
    body = {
        error: 'Check your JSON body'
      }
    render json: body, :status => 400
  end
end
