#!/bin/sh

nodesNumber=$1
SOURCE_DIR=dbscripts
DEST_DIR_PREFIX=dbscripts_

echo "Starting sequence updator"

echo "Cleaning up workspace"
for i in $(seq 1 $nodesNumber); do
  rm $DEST_DIR_PREFIX$i.zip
  rm -r $DEST_DIR_PREFIX$i
done

echo "Creating new workspace"
for i in $(seq 1 $nodesNumber); do
  cp -r $SOURCE_DIR $DEST_DIR_PREFIX$i
done

for i in $(seq 1 $nodesNumber); do
  for filename in $(find $DEST_DIR_PREFIX$i -name 'oracle.sql'); do
    echo "Updating $filename"
    sed -i "s/START WITH 1 INCREMENT BY 1/START WITH $i INCREMENT BY $nodesNumber/g" $filename
  done
done

for i in $(seq 1 $nodesNumber); do
  zip -r $DEST_DIR_PREFIX$i.zip $DEST_DIR_PREFIX$i/
done
echo "Sequence updator completed successfully"
