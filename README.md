# sinatra_stdout_server

Simple sinatra server that prints requests to stdout. Useful for debugging cryptic http libraries

Start the server using `thor start`

Example request

```ruby
RestClient.get 'localhost:4567', {headers: {params: {a: 1, b:2}}}
```

Server response

```ruby
{
  "PATH_INFO": "/",
  "REQUEST_METHOD": "GET",
  "REQUEST_URI": "http://localhost:4567/",
  "HTTP_ACCEPT": "*/*; q=0.5, application/xml",
  "HTTP_ACCEPT_ENCODING": "gzip, deflate",
  "HTTP_HEADERS": "{:params=>{:a=>1, :b=>2}}",
  "HTTP_USER_AGENT": "Ruby",
  "HTTP_HOST": "localhost:4567",
  "HTTP_VERSION": "HTTP/1.1",
  "REQUEST_PATH": "/"
}
```
