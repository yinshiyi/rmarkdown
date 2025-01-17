Inspiration from [README.md](https://github.com/csdaw/rmarkdown-tinytex)

Build

```
# build amd64 platform 
docker buildx build --platform linux/amd64 -t shiyiyin:rmarkdown:amd64 .
```
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

```r
# source https://github.com/r-lib/devtools/issues/2472#issuecomment-1272322019
install.packages("pak", repos = sprintf("https://r-lib.github.io/p/pak/stable/%s/%s/%s", .Platform$pkgType, R.Version()$os, R.Version()$arch))

```
