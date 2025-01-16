Inspiration from [README.md](https://github.com/csdaw/rmarkdown-tinytex)

Build
```
# user can set different R versions, default is 4.2
# takes 500s
docker build . -t rmarkdown --build-arg R=latest
```

```
# takes 500s
DOCKER_BUILDKIT=1 docker build -t shiyiyin/rmarkdown:test . --build-arg R=4.2
```

Push
```
docker push shiyiyin/rmarkdown:latest
```


## Run container and knit test document automatically

```bash
cd # to wherever this folder is
docker run --rm -v $PWD:/home -w /home shiyiyin/rmarkdown \
  Rscript -e 'rmarkdown::render("test.Rmd")'
```

## Run container and knit test document interactively

```bash
cd # to wherever this folder is
docker run --rm -it -v $PWD:/home -w /home shiyiyin/rmarkdown R
```

```r 
rmarkdown::render("test.Rmd")
```
