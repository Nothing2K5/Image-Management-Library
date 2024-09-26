package com.DRAGON.paging;

import com.DRAGON.sort.Sorter;

public interface Pageable {
	Integer getPage();

	Integer getOffset();

	Integer getLimit();

	Sorter getSorter();
}
