#
#  Elastic Beanstalk Bundle Collector Script
#  John Z
#  Amazon Web Services
#

mkdir -p bundle

for file in /opt/elasticbeanstalk/tasks/bundlelogs.d/*
do
 # do something on $file
  input="$file"
  while IFS= read -r line
  do
    cp -R $line ./bundle/
  done < "$input"
done

tar -czf bundle.tar.gz bundle/

rm -rf bundle/
