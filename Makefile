download:
	wget https://hobbitdata.informatik.uni-leipzig.de/ODP/europeandataportal.jsonl.gz -O data/europeandataportal.jsonl.gz

unpack:
	gunzip data/europeandataportal.jsonl.gz

get-data: download unpack

start-jupyter:
	echo "Run the following command to limit to 4GB of RAM"
	echo "ulimit -v 8388608"
	echo "jupyter notebook"

filter-german-datasets:
	grep "http://publications.europa.eu/resource/authority/language/GER" data/europeandataportal.jsonl > data/europeandataportal-ger-1.jsonl
	grep -v "http://publications.europa.eu/resource/authority/language/GER" data/europeandataportal.jsonl > data/europeandataportal-non-ger.jsonl
	grep "www.govdata.de" data/europeandataportal-non-ger.jsonl > data/europeandataportal-ger-2.jsonl
	cat data/europeandataportal-ger-1.jsonl data/europeandataportal-ger-2.jsonl > data/europeandataportal-ger.jsonl
