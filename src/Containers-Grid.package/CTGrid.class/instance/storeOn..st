printing
storeOn: aStream
	aStream
		nextPut: $(;
		nextPutAll: self class name;
		nextPutAll: ' rows: ';
		store: rowCount;
		nextPutAll: ' columns: ';
		store: columnCount;
		nextPutAll: ' contents: ';
		store: contents;
		nextPut: $).
		
