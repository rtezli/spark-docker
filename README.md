#spark-docker

Spark 1.5.0 Hadoop 2.6 image
Based on vanilla rtezli/java:0.0.1
Virtual size 620.3 MB
Apt packages: procps

To run the image as master use i.e. :

`docker run --name spark-master -it -h spark-master01 -p 6066:6066 -p 7077:7077 -p 8080:8080 rtezli/spark:0.0.1 master`

To run the image as worker use i.e. :

`docker run -it rtezli/spark:0.0.1 worker spark://spark-master01:7077`

If you are running the master and worker on the same docker host, don't forget to --link spark-master:spark-master 