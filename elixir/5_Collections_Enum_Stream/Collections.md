

Elixir comes with a number of types that act as collections. lists and dictionaries. there are also ranges, files, even functions that can be enumerated. we can also define our own.

All these collections share a trait in that they are iterable. Elixir provides us with two modules Enum and Stream. Anything that can be iterated in elixir uses the Enumerable protocol.

The Enum module will be mostly used. The Stream module is almost the same but iterates through stuff lazily( only calculating when needed ).


<h3>Enum for processing collections</h3>
there are a lot of functions in Enum module, and a few are listed below

<br><br>
<ul>
  <li><code>Enum.to_list(1..5)</code> converts any enumerable into a list</li>

  <li><code>Enum.concat([1,2,3], ["A","b","c"])</code> concatenates both collections</li>

  <li><code>Enum.map([1,2,3], &(&1 * &1))</code> map all elements after performing a function on each</li>

  <li><code>Enum.at([1,2,3,4], 2)</code> gives the element at the index described</li>

  <li><code>Enum.filter([1,2,3,4], &(&1 < 15))</code> filters all elements based on the given function. If the function returns true, it is retained, if it returns false it discards the element.</li>

  <li><code>Enum.at([1,2,3,4], &(&1 > 3))</code> filters every element except those that match the function given.</li>

  <li><code>Enum.sort([3,5,6,1,2,9], &(String.length(&1) <= String.length(&2)))</code> sorts the enumerable based on the function given. if function is true, it sorts else it keeps as is</li>

  <li><code>Enum.max( [1,2,3,4] )</code> gives the maximum element of the list</li>

  <li><code>Enum.max_by( ["hi","hello", "wow", "okay"], &(String.length/1) )</code> gives the max element based on the function given for the particular type</li>

  <li><code>Enum.take( [1,2,3,4], 3 )</code> gives a new collection with just the first n elements given in the second parameter</li>

  <li><code>Enum.take_every( [1,2,3,4], 2 )</code> selects every nth element( second here ) from the collection</li>

  <li><code>Enum.take_while( [1,2,3,4], &(&1<4) )</code> selects every element that matches and returns true in the function given as second argument.</li>

  <li><code>Enum.split( [1,2,3,4], 3 )</code> splits the collection into two at the index mentioned</li>

  <li><code>Enum.split_while( [1,2,3,4], 3 )</code> splits the collection into two until the condition is satisfied</li>

  <li><code>Enum.join( [1,2,3,4] )</code> joins the collection into a string </li>

  <li><code>Enum.join( [1,2,3,4], " , " )</code> joins the collection with the second argument</li>

  <li><code>Enum.all?( [1,2,3,4], &(&1 < 4) )</code> checks if all elements in the collection match the function</li>

  <li><code>Enum.any?( [1,2,3,4], &(&1 < 4) )</code> checks if any of the  elements in the collection match the function</li>

  <li><code>Enum.member?( [1,2,3,4], 2 )</code> checks if second argument is part of the collection</li>

  <li><code>Enum.zip( [1,2,3], [:a, :b, :c] )</code> gives a new list where the elements are paired with those in the second argument</li>

  <li><code>Enum.with_index( [1,2,3] )</code> creates a list of sets with the second element as their index</li>

  <li><code>Enum.reduce( [1,2,3,4], &(&1 + &2) )</code> reduces the enumerable into a single value based on the function</li>

</ul>

<i>the <- is syntax for generator and is used mostly with for. it means a range</i>

<b>deal a hand of cards</b><br>
<code>import enum</code><br>
<code>deck = for rank <- '23456789TJQKA', suit <- 'CDHS', do: [suit,rank]</code><br>
<code>deck |> shuffle |> take(20)</code>  select 20 random cards from the deck<br>
<code>hands = deck |> shuffle |> chunk(13)</code> split the deck into random 13 chunks.


<b>Sorting</b>

when sorting with a custom function always use <= and not just < for the sort to be stable