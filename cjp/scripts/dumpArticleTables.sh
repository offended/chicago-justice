#!/bin/bash

# The purpose of this script is to dump the news article data to a downloadable
# archive for analysis purposes.
#
# In order to authenticate

DATABASE_URL=chicagojustice.cbeugrz1koxf.us-east-1.rds.amazonaws.com

cd ~
mkdir cjp_tables
psql cjpweb_prd -h $DATABASE_URL -U cjpuser -c "\\copy newsarticles_article to 'cjp_tables/newarticles_article.csv' with csv"
psql cjpweb_prd -h $DATABASE_URL -U cjpuser -c "\\copy newsarticles_category to 'cjp_tables/newsarticles_category.csv' with csv"
psql cjpweb_prd -h $DATABASE_URL -U cjpuser -c "\\copy newsarticles_article_categories to 'cjp_tables/newsarticles_article_categories.csv' with csv"
tar -czf cjp_tables.tgz cjp_tables/
rm -r cjp_tables
