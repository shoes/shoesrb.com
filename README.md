## shoesrb.com

The website for [shoes!](https://github.com/shoes/shoes)

## Getting going

```
$ gem install jekyll
$ jekyll serve
$ open http://localhost:4000
```

Wooo!

## Building the contributors page.
The contributors pages is built by adding the cumulative commits from all members of the community (all contributors to all repos in the Shoes organization).  You will need to set a GITHUB_TOKEN in a .env file and then run `ruby lib/data_builder.rb`.

This will generate two data files which are saved in the `_data` directory: `repos.yml` and `community.yml`.  `community.yml` is the data used with the liquid template in `contribute.html` page to render the community section.

### API Endpoints:
Members of Shoes: https://api.github.com/orgs/shoes/members  
Contributors to Specific Repo: https://api.github.com/repos/shoes/shoes4/contributors  
List all repos :https://api.github.com/orgs/shoes/repos  