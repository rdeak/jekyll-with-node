# jekyll-with-node

Docker image that runs Jekyll with Tailwind 

## Create a new site from current directory
```bash
docker run -v $(pwd):/site:Z jekyll new .
```

## To serve site locally
```bash
docker run -p 4000:4000 -p 35729:35729 --rm -it -v $(pwd):/site:Z jekyll-serve
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
