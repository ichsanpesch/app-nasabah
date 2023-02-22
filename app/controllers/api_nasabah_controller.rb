require 'net/http'

class ApiNasabahController < ApplicationController

    def GetData
        http = Net::HTTP.new($HostBackend, $PortBackend)
        uri = '/services/nasabah'
        request = Net::HTTP::Get.new(uri)
        response = http.request(request)
        render json: response.body
    end

    def GetDataById
        http = Net::HTTP.new($HostBackend, $PortBackend)
        id = params[:p_id]
        uri = '/services/nasabah/'+id
        request = Net::HTTP::Get.new(uri)
        response = http.request(request)
        render json: response.body
    end

    def InsertData
        http = Net::HTTP.new($HostBackend, $PortBackend)
        data = params[:p_data]
        uri = '/services/nasabah/'+data
        request = Net::HTTP::Post.new(uri)
        response = http.request(request)
        render json: response.body
    end

    def UpdateData
        http = Net::HTTP.new($HostBackend, $PortBackend)
        data = params[:p_data]
        uri = '/services/nasabah/'+data
        request = Net::HTTP::Put.new(uri)
        response = http.request(request)
        render json: response.body
    end

    def DeleteDataById
        http = Net::HTTP.new($HostBackend, $PortBackend)
        id = params[:p_id]
        uri = '/services/nasabah/'+id
        request = Net::HTTP::Delete.new(uri)
        response = http.request(request)
        render json: response.body
    end

    def LoginByEmailPassword
        http = Net::HTTP.new($HostBackend, $PortBackend)
        data = params[:p_data]
        uri = '/auth/nasabah/'+data
        request = Net::HTTP::Post.new(uri)
        response = http.request(request)
        responseBody = JSON.parse(response.body)
        total = responseBody['data'].count
        dataJsonEncode = JSON.generate({'total'=>total, 'user'=>responseBody['data']})
        case total
        when 0
            render json: dataJsonEncode
        else 
            render json: dataJsonEncode
        end
    end

end
