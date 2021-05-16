
require 'rails_helper'
require 'webmock/rspec'


RSpec.describe RecipeService, type: :service do

  context '' do
    before (:each) do
      stub_request(:get, "http:///spaces//entries").
         with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization'=>'Bearer', 'User-Agent'=>'Ruby'}).
        to_return(body: "{}", status: 200,
        headers: { 'Content-Length' => 3 })

      expected_response_list = {
        "sys": {
            "type": "Array"
        },
        "total": 4,
        "skip": 0,
        "limit": 100,
        "items": [
          {
            "metadata": {
                "tags": []
            },
            "fields": {
                "title": "White Cheddar Grilled Cheese with Cherry Preserves & Basil",
                "photo": {
                    "sys": {
                        "type": "Link",
                        "linkType": "Asset",
                        "id": "61XHcqOBFYAYCGsKugoMYK"
                    }
                },
                "calories": 788,
                "description": "*Grilled Cheese 101*: Use delicious cheese and good quality bread; make crunchy on the outside and ooey gooey on the inside; add one or two ingredients for a flavor punch! In this case, cherry preserves serve as a sweet contrast to cheddar cheese, and basil adds a light, refreshing note. Use __mayonnaise__ on the outside of the bread to achieve the ultimate, crispy, golden-brown __grilled cheese__. Cook, relax, and enjoy!",
                "tags": [
                    {
                        "sys": {
                            "type": "Link",
                            "linkType": "Entry",
                            "id": "3RvdyqS8408uQQkkeyi26k"
                        }
                    }
                ]
            },
            "sys": {
                "space": {
                    "sys": {
                        "type": "Link",
                        "linkType": "Space",
                        "id": "kk2bw5ojx476"
                    }
                },
                "id": "4dT8tcb6ukGSIg2YyuGEOm",
                "type": "Entry",
                "createdAt": "2018-05-07T13:38:22.351Z",
                "updatedAt": "2018-05-07T13:41:01.986Z",
                "environment": {
                    "sys": {
                        "id": "master",
                        "type": "Link",
                        "linkType": "Environment"
                    }
                },
                "revision": 2,
                "contentType": {
                    "sys": {
                        "type": "Link",
                        "linkType": "ContentType",
                        "id": "recipe"
                    }
                },
                "locale": "en-US"
            }
          }
        ],"includes": {
          "Entry": [
              {
                  "metadata": {
                      "tags": []
                  },
                  "sys": {
                      "space": {
                          "sys": {
                              "type": "Link",
                              "linkType": "Space",
                              "id": "kk2bw5ojx476"
                          }
                      },
                      "id": "3RvdyqS8408uQQkkeyi26k",
                      "type": "Entry",
                      "createdAt": "2018-05-07T13:27:45.974Z",
                      "updatedAt": "2018-05-07T13:27:45.974Z",
                      "environment": {
                          "sys": {
                              "id": "master",
                              "type": "Link",
                              "linkType": "Environment"
                          }
                      },
                      "revision": 1,
                      "contentType": {
                          "sys": {
                              "type": "Link",
                              "linkType": "ContentType",
                              "id": "tag"
                          }
                      },
                      "locale": "en-US"
                  },
                  "fields": {
                      "name": "vegan"
                  }
              }
          ],
          "Asset": [
              {
                  "metadata": {
                      "tags": []
                  },
                  "sys": {
                      "space": {
                          "sys": {
                              "type": "Link",
                              "linkType": "Space",
                              "id": "kk2bw5ojx476"
                          }
                      },
                      "id": "61XHcqOBFYAYCGsKugoMYK",
                      "type": "Asset",
                      "createdAt": "2018-05-07T13:37:53.784Z",
                      "updatedAt": "2018-05-07T13:37:53.784Z",
                      "environment": {
                          "sys": {
                              "id": "master",
                              "type": "Link",
                              "linkType": "Environment"
                          }
                      },
                      "revision": 1,
                      "locale": "en-US"
                  },
                  "fields": {
                      "title": "SKU1240 hero-374f8cece3c71f5fcdc939039e00fb96",
                      "file": {
                          "url": "//images.ctfassets.net/kk2bw5ojx476/61XHcqOBFYAYCGsKugoMYK/0009ec560684b37f7f7abadd66680179/SKU1240_hero-374f8cece3c71f5fcdc939039e00fb96.jpg",
                          "details": {
                              "size": 194737,
                              "image": {
                                  "width": 1020,
                                  "height": 680
                              }
                          },
                          "fileName": "SKU1240_hero-374f8cece3c71f5fcdc939039e00fb96.jpg",
                          "contentType": "image/jpeg"
                      }
                  }
              }
          ]
      }
    }


    expected_single_recipe_response = {
        "metadata": {
            "tags": []
        },
        "sys": {
            "space": {
                "sys": {
                    "type": "Link",
                    "linkType": "Space",
                    "id": "kk2bw5ojx476"
                }
            },
            "id": "2E8bc3VcJmA8OgmQsageas",
            "type": "Entry",
            "createdAt": "2018-05-07T13:30:34.066Z",
            "updatedAt": "2018-05-07T13:37:01.760Z",
            "environment": {
                "sys": {
                    "id": "master",
                    "type": "Link",
                    "linkType": "Environment"
                }
            },
            "revision": 3,
            "contentType": {
                "sys": {
                    "type": "Link",
                    "linkType": "ContentType",
                    "id": "recipe"
                }
            },
            "locale": "en-US"
        },
        "fields": {
            "title": "Grilled Steak & Vegetables with Cilantro-Jalapeño Dressing",
            "photo": {
                "sys": {
                    "type": "Link",
                    "linkType": "Asset",
                    "id": "3TJp6aDAcMw6yMiE82Oy0K"
                }
            },
            "calories": 345,
            "description": "Warmer weather means the ushering in of grill season and this recipe completely celebrates the grill (or grill pan)! Squash and green beans are nicely charred then take a bath in a zesty cilantro-jalapeño dressing. After the steaks are perfectly seared, the same dressing does double duty as a tasty finishing sauce. A fresh radish salad tops it all off for crunch and a burst of color. Cook, relax, and enjoy!",
            "chef": {
                "sys": {
                    "type": "Link",
                    "linkType": "Entry",
                    "id": "1Z8SwWMmS8E84Iogk4E6ik"
                }
            }
        }
    }

    expected_single_chef_response = {
      "metadata": {
          "tags": []
      },
      "sys": {
          "space": {
              "sys": {
                  "type": "Link",
                  "linkType": "Space",
                  "id": "kk2bw5ojx476"
              }
          },
          "id": "1Z8SwWMmS8E84Iogk4E6ik",
          "type": "Entry",
          "createdAt": "2018-05-07T13:28:25.324Z",
          "updatedAt": "2018-05-07T14:17:27.403Z",
          "environment": {
              "sys": {
                  "id": "master",
                  "type": "Link",
                  "linkType": "Environment"
              }
          },
          "revision": 2,
          "contentType": {
              "sys": {
                  "type": "Link",
                  "linkType": "ContentType",
                  "id": "chef"
              }
          },
          "locale": "en-US"
      },
      "fields": {
          "name": "Mark Zucchiniberg "
      }
    }

    expected_single_tag_response = {
      "metadata": {
          "tags": []
      },
      "sys": {
          "space": {
              "sys": {
                  "type": "Link",
                  "linkType": "Space",
                  "id": "kk2bw5ojx476"
              }
          },
          "id": "3RvdyqS8408uQQkkeyi26k",
          "type": "Entry",
          "createdAt": "2018-05-07T13:27:45.974Z",
          "updatedAt": "2018-05-07T13:27:45.974Z",
          "environment": {
              "sys": {
                  "id": "master",
                  "type": "Link",
                  "linkType": "Environment"
              }
          },
          "revision": 1,
          "contentType": {
              "sys": {
                  "type": "Link",
                  "linkType": "ContentType",
                  "id": "tag"
              }
          },
          "locale": "en-US"
      },
      "fields": {
          "name": "vegan"
      }
    }

    expected_single_image_response = {
      "metadata": {
          "tags": []
      },
      "sys": {
          "space": {
              "sys": {
                  "type": "Link",
                  "linkType": "Space",
                  "id": "kk2bw5ojx476"
              }
          },
          "id": "61XHcqOBFYAYCGsKugoMYK",
          "type": "Asset",
          "createdAt": "2018-05-07T13:37:53.784Z",
          "updatedAt": "2018-05-07T13:37:53.784Z",
          "environment": {
              "sys": {
                  "id": "master",
                  "type": "Link",
                  "linkType": "Environment"
              }
          },
          "revision": 1,
          "locale": "en-US"
      },
      "fields": {
          "title": "SKU1240 hero-374f8cece3c71f5fcdc939039e00fb96",
          "file": {
              "url": "//images.ctfassets.net/kk2bw5ojx476/61XHcqOBFYAYCGsKugoMYK/0009ec560684b37f7f7abadd66680179/SKU1240_hero-374f8cece3c71f5fcdc939039e00fb96.jpg",
              "details": {
                  "size": 194737,
                  "image": {
                      "width": 1020,
                      "height": 680
                  }
              },
              "fileName": "SKU1240_hero-374f8cece3c71f5fcdc939039e00fb96.jpg",
              "contentType": "image/jpeg"
          }
      }
  }

    stub_request(:get, "https://cdn.contentful.com/spaces/kk2bw5ojx476/entries?content_type=recipe&select=sys,fields&skip=0").
      with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization'=>'Bearer 7ac531648a1b5e1dab6c18b0979f822a5aad0fe5f1109829b8a197eb2be4b84c', 'User-Agent'=>'Ruby'}).
      to_return(status: 200, body: expected_response_list.to_json, :headers => {})


      # single recipe
      stub_request(:get, "https://cdn.contentful.com/spaces/kk2bw5ojx476/entries/2E8bc3VcJmA8OgmQsageas").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization'=>'Bearer 7ac531648a1b5e1dab6c18b0979f822a5aad0fe5f1109829b8a197eb2be4b84c', 'User-Agent'=>'Ruby'}).
        to_return(status: 200, body: expected_single_recipe_response.to_json, :headers => {})

      # chef
      stub_request(:get, "https://cdn.contentful.com/spaces/kk2bw5ojx476/entries/1Z8SwWMmS8E84Iogk4E6ik").
      with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization'=>'Bearer 7ac531648a1b5e1dab6c18b0979f822a5aad0fe5f1109829b8a197eb2be4b84c', 'User-Agent'=>'Ruby'}).
      to_return(status: 200, body: expected_single_chef_response.to_json, :headers => {})

      #single tag
      stub_request(:get, "https://cdn.contentful.com/spaces/kk2bw5ojx476/entries/3RvdyqS8408uQQkkeyi26k").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization'=>'Bearer 7ac531648a1b5e1dab6c18b0979f822a5aad0fe5f1109829b8a197eb2be4b84c', 'User-Agent'=>'Ruby'}).
        to_return(status: 200, body: expected_single_tag_response.to_json, :headers => {})

      #single image
      stub_request(:get, "https://cdn.contentful.com/spaces/kk2bw5ojx476/assets/3TJp6aDAcMw6yMiE82Oy0K").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization'=>'Bearer 7ac531648a1b5e1dab6c18b0979f822a5aad0fe5f1109829b8a197eb2be4b84c', 'User-Agent'=>'Ruby'}).
        to_return(status: 200, body: expected_single_image_response.to_json, :headers => {})
        

      
    end

    context "Fetchin all recipes" do
      it " returns array of recipes" do 
        result = RecipeService.new({}).get_page(0)
        expect(result).to_not eq([])
        expect(result.first.with_indifferent_access["id"]).to eq("4dT8tcb6ukGSIg2YyuGEOm")
      end
    end

    context "Fetchin single recipe detail" do
      it " returns hash of recipe" do 
        result = RecipeService.new({}).get_detail("2E8bc3VcJmA8OgmQsageas")
        expect(result).to_not eq({})

        expect(result.with_indifferent_access["id"]).to eq("2E8bc3VcJmA8OgmQsageas")
      end
    end

  end

end