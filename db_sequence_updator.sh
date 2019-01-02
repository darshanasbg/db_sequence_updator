#!/bin/sh
SOURCE_DIR=dbscripts
SEQ_START=2
SEQ_INC=2
DEST_DIR=dbscripts_$SEQ_START

echo "Starting sequence updator"

echo "Cleaning up workspace"
rm $DEST_DIR.zip
rm -r $DEST_DIR

echo "Creating new workspace"
cp -r $SOURCE_DIR $DEST_DIR


for filename in $(find $DEST_DIR -name 'oracle.sql'); do
  echo "Updating $filename"
  sed -i '' "s/START WITH 1 INCREMENT BY 1/START WITH $SEQ_START INCREMENT BY $SEQ_INC/g" $filename

done


zip -r $DEST_DIR.zip $DEST_DIR/
echo "Sequence updator completed successfully"
