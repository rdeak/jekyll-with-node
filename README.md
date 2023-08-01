# jekyll-with-node

Docker image with Jakyll 4.3.2 and Node.js v20 runtime 

## Create a new site from current directory
```bash
docker run --rm -it -v $(pwd):/site:Z bert84/jekyll build . --new
```

## To serve site locally
```bash
docker run -p 4000:4000 -p 35729:35729 --rm -it -v $(pwd):/site:Z bert84/jekyll-serve
```

## Useful dev commands
- build Jekyll image locally
```bash
docker build --target base -t jekyll:latest .
```

- build Jekyll serve image locally
```bash
docker build -t jekyll-serve:latest .
```
