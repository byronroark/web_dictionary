require 'webrick'

class WebDictionary <WEBrick::HTTPServlet:AbstractServlet
  def do_GET(request, response)
    if File.exist?("dictionary.txt")
      words = File.readlines("dictionary.txt")
    else
      words = []
    end

    response.status = 200
    response.body = %{
      <html>
        <body>
        <form method="POST" action="/search"
        <ul>
          <li><input name="search_word" /></li>
        </ul>
        <button type="submit">Search</button>
        </form>
        <a href="/add>Add Word</a>
        <p>#{words.join("<br />")}</p>
        </body>
      </html>
    }
  end
end

class AddWord < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(request, response)
    if File.exist?("dictionary.txt")
      words = File.readlines("dictionary.txt")
    else
      words = []
    end

    response.status = 200
    response.body = %{
      <html>
        <body>
        <form method="POST" action="/save">
        <ul>
          <li><input name="word" /></li>
          <li><input name="definition" /></button>
        </ul>
        </body>
      </html>
    }
  end
end

class SaveWord < WEBrick::HTTPServlet::AbstractServlet
  def do_POST(request, response)
    File.open("dictionary.txt", "a+") do |file|
      file.puts "Word: #{request.query["word"]} Definition: #{request.query["definition"]}"
    end

    response.status = 302
    response.header["Location"] = "/"
    response.body = "Added Word!"
  end
end
