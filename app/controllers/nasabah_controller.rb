require 'net/http'

class NasabahController < ApplicationController

  def Register
    render "nasabah/register"
  end

  def ApiRegister
    http = Net::HTTP.new($HostFrontend, $PortFrontend)
    uri = '/api-insert-nasabah'
    email = params[:p_email]
    password = params[:p_password]
    data = {'email' => email, 'password' => password}
    dataJsonEncode = JSON.generate(data)
    dataBase64Encode = Base64.strict_encode64(dataJsonEncode)
    request = Net::HTTP::Post.new(uri)
    request.set_form_data({'p_data' => dataBase64Encode})
    response = http.request(request)
    render json: response
  end

  def Login
    render "nasabah/login"
  end

  def ApiLogin
    http = Net::HTTP.new($HostFrontend, $PortFrontend)
    uri = '/api-login-nasabah'
    email = params[:p_email]
    password = params[:p_password]
    data = {'email' => email, 'password' => password}
    dataJsonEncode = JSON.generate(data)
    dataBase64Encode = Base64.strict_encode64(dataJsonEncode)
    request = Net::HTTP::Post.new(uri)
    request.set_form_data({'p_data' => dataBase64Encode})
    response = http.request(request)
    responseBody = JSON.parse(response.body)
    total = responseBody["total"]
    case total
    when 0
        render js: "alert('Wrong username or password');"
    else 
        # render js: "alert('Logged in');"
        session[":email"] = responseBody["user"][0]["email"]
        puts session[":email"]
        redirect_to ""
    end
  end

end
