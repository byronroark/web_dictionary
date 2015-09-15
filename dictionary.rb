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
