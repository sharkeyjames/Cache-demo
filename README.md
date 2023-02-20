# Cache Demo

Demonstration tool for interactions between browsers, and cache related response headers.

## Running the demo

Launch the website.

```sh
npx serve ./website
```

**In a separate terminal** start the API.

```sh
cd api
bundle install
ruby myapp.rb
```

Navigate to http://localhost:3000/

## Notable info

The `304 Not Modified` response status is not available though the Fetch API since the browser handles any `304`'s and returns the result with a `200 OK` response status.

I found [this explanation on Stack Overflow](https://stackoverflow.com/a/66757539) helpful to understand more about what's going on in the browser.

Firefox makes it easier than Chrome to understand what's occurring since it actually displays the `304 Not Modified` response status in the developer tools network tab.
