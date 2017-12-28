pattern: ^<%#[a-z\s]*-%>

https://regexr.com/

```bash

#!/bin/bash

list="$(find /home/daniel/git/kukulkan-generator-angularjs/src/main/resources/templates/archetypes -iregex '.*/_+.*')"

for file in $list;
do
        prep=$file	
	result=$(echo $file | sed 's/_//')
	result=$(echo "$result.ftl")
	mv $prep $result
done
```


```bash
#!/bin/bash

FILES_TO_PROCESS=$(find /home/daniel/git/kukulkan-generator-angularjs/src/main/resources/templates/archetypes/ -type f)


for FILE in $FILES_TO_PROCESS;
do
	echo $FILE
done
```
