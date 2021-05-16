require 'httparty'

class RecipeService

  def initialize(params)
    @errors         = []
  end

  def get_page(page = 0)
    recipes = []
    begin
      response = HTTParty.get("#{ENV["CONTENTFUL_API_URL"]}/spaces/#{ENV["SPACE_ID"]}/entries?select=sys,fields&content_type=recipe&skip=#{page * 100}",
        headers: {
          "Authorization": "Bearer #{ENV["CONTENTFUL_ACCESS_TOKEN"]}"
        }
      )
      body = JSON.parse(response.body)
      # debugger
      (body["items"] || []).each do |item|
        recipes.push({
          id: item["sys"]["id"],
          title: item["fields"]["title"],
          description: item["fields"]["description"],
          calories: item["fields"]["calories"],
          image: (body["includes"]["Asset"].select{ |x| x["sys"]["id"] == item["fields"]["photo"]["sys"]["id"] }).first["fields"]["file"]
        })
      end
    rescue => exception
      # logger      
    end
    recipes
  end

  def get_detail(id)
    begin
      response = HTTParty.get("#{ENV["CONTENTFUL_API_URL"]}/spaces/#{ENV["SPACE_ID"]}/entries/#{id}",
        headers: {
          "Authorization": "Bearer #{ENV["CONTENTFUL_ACCESS_TOKEN"]}"
        }
      )
      body = JSON.parse(response.body)
  
      image_response_body = {}
      if body["fields"]["photo"] && body["fields"]["photo"]["sys"] && body["fields"]["photo"]["sys"]["id"]
        image_response = HTTParty.get("#{ENV["CONTENTFUL_API_URL"]}/spaces/#{ENV["SPACE_ID"]}/assets/#{body["fields"]["photo"]["sys"]["id"]}",
          headers: {
            "Authorization": "Bearer #{ENV["CONTENTFUL_ACCESS_TOKEN"]}"
          }
        )
        image_response_body = JSON.parse(image_response.body)
      end
  
      chef_response_body = {}
      if body["fields"]["chef"] && body["fields"]["chef"]["sys"] && body["fields"]["chef"]["sys"]["id"]
        chef_response = HTTParty.get("#{ENV["CONTENTFUL_API_URL"]}/spaces/#{ENV["SPACE_ID"]}/entries/#{body["fields"]["chef"]["sys"]["id"]}",
          headers: {
            "Authorization": "Bearer #{ENV["CONTENTFUL_ACCESS_TOKEN"]}"
          }
        )
        chef_response_body = JSON.parse(chef_response.body)
      end
  
  
      tags = []
      if body["fields"]["tags"] && body["fields"]["tags"].is_a?(Array) && body["fields"]["tags"].length > 0
        body["fields"]["tags"].each do |tag|
          tag_response = HTTParty.get("#{ENV["CONTENTFUL_API_URL"]}/spaces/kk2bw5ojx476/entries/#{tag["sys"]["id"]}",
            headers: {
              "Authorization": "Bearer #{ENV["CONTENTFUL_ACCESS_TOKEN"]}"
            }
          )
          tag_response_body = JSON.parse(tag_response.body)
          tags << tag_response_body["fields"]["name"]
        end
      end
      {
        id: body["sys"]["id"],
        title: body["fields"]["title"],
        description: body["fields"]["description"],
        calories: body["fields"]["calories"],
        tags: tags,
        chef: chef_response_body["fields"],
        image: {
          url: image_response_body["fields"]["file"]["url"]
        },
      }
  
    rescue => exception
      {}
    end

  end


end