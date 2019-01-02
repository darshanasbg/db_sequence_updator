# db_sequence_updator

When you have multi-master database cluster, in some cases different nodes in the cluster should generates unique primary keys.

When you have auto increment sequences generating primary key's in your database scripts, starting from the start index 1 & increment by 1, it cannot use default database scripts and you need to update database scripts to have different start indexes and appropriate increment value.

This project is done to overcome that issue for WSO2 Identity Server.
* https://github.com/wso2/product-is
* https://wso2.com/identity-and-access-management/

## How to use

1. Download the script [db_sequence_updator.sh](db_sequence_updator.sh) 
2. Copy xxx to CARBON_HOME
3. Run the sript by giving number of nodes in your database cluster.
Example: `sh db_sequence_updator.sh 2`

## Roadmap & Contributions

Currently the [db_sequence_updator.sh](db_sequence_updator.sh) is only handling oracle scripts. Its need to improve to support all the db sripts thats shipped with the WSO2 Identity Server. Feel free to send any contributions adding support new database types or any other improvement.
