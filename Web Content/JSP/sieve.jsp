<%
String email=(String)session.getAttribute("email");
if(email==null)
{
	response.sendRedirect("index.jsp");
}
else
{	
%>

<!DOCTYPE html>
<html lang="en" >

<head>
  <meta charset="UTF-8">
  <title>The Sieve of Eratosthenes</title>
  
  
	<script src="js/jqueryForJPrompt.js" type="text/javascript"></script>
        <script src="js/jquery.alerts.js" type="text/javascript"></script>
        <link href="css/jquery.alerts.css" rel="stylesheet" type="text/css" media="screen" />

      <link rel="stylesheet" href="css/style.css">

  
</head>
<style>
body {
        background-color:WhiteSmoke ;
} 
.about {
   margin: 0 auto;
   width: 80%;
   text-align: center;

}
.algo{
margin: 0 auto;
   width: 50%;
   text-align: center;
   background-color: CornflowerBlue;
   font-family:Calibri;
}
.center {
    display: block;
    margin-left: auto;
    margin-right: auto;
    width: 50%;
	}
</style>
<body>
<h3 align="center"><b>The Sieve of Eratosthenes</b></h3>
    <div> 
      &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	  The sieve of Eratosthenes can be expressed in pseudocode, as follows:
	  	<img align ="center" src="images/s.png" class="center">

	  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	  This algorithm produces all primes not greater than n. 
	  <br/>
	  <br/><b>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	  To start click on <button onclick="step()">Get Prime </button></b>
    <br/></div>  
	<div>&emsp;&emsp;&emsp;</div>
  
<div class='about'>

    <script>
	
   
    const MAXIMUM = 300;
    const COLUMNS = 25;

    // Foreground colors for numeric table data, by number kind.
    const MERSENNE_COLOR         = '#ff00ff';
    const SOPHIE_GERMAIN_COLOR   = '#ff00ff';
    const MERSENNE_GERMAIN_COLOR = '#ff00ff';
    const PRIME_COLOR            = '#ff00ff';
    const COMPOSITE_COLOR        = 'skyblue';

    // Animation delay parameters, units are milliseconds. A delay value of 0
    // makes the animation go as fast as it can.
    const PRIME_DELAY     = 0;
    const COMPOSITE_DELAY = 0;

   
    const get = id => document.getElementById(id);
    const write = s => document.write(s);

   
    const isMersenne = p => (p & (p + 1)) == 0;

    
    function padLeft(i, d) {
        var s = '' + i;         // convert i to string type using '' + i
        var n = s.length;
        while (n < d) {
            s = '&nbsp;' + s;   // pad with non-breaking space characters
            n = n + 1;
        }
        return s;
    }

    
    function table(n) {
        var a = ['<table>'];    // a accumulates the strings to join and write
        var i = 1;
        while (i <= n) {
            // i % j is the remainder of i divided by j. This is how we know to
            // start a new table row (tr) element: if in column 1, 33, 65, etc.
            if (i % COLUMNS == 1) {
                a.push('<tr>');
            }

            // Write the table datum element containing i padded to 4 spaces
            // FIXME: MAXIMUM > 9999 requires 5 or more spaces; compute field width
            a.push('<td id=' + i + ' class=tooltip title=' + i + '>' + padLeft(i, 4) + '</td>');

            // Now check for the last column in a table row, to close the tr.
            if (i % COLUMNS == 0) {
                a.push('</tr>');
            }
            i = i + 1;
        }
        a.push('</table>');
        write(a.join(''));      // join a's elements with '' in between each
    }

   
    function* sieve(n) {
        // Start with 2 because we know 1 like 0 is neither prime nor composite.
        var i = 2;
        var td, td2;

        while (i <= n) {
            // Get the table datum identified by i and see if we've marked it
            // yet with an 'isPrime' flag property.
            td = get(i);

            if (!td.hasOwnProperty('isPrime')) {
                // We have not yet marked this number, so it must be prime.
                td.isPrime = true;

                // Now recolor this prime number by setting its foreground color
                // to one of the prime colors we have chosen. We use the ternary
                // conditional operator (A ? B : C) which evaluates to B if A is
                // "truthy", else to C.
                td.style.color = isMersenne(i) ? MERSENNE_COLOR : PRIME_COLOR;

                // Tell our scheduler (the function named step, declared further
                // below) to wait PRIME_DELAY milliseconds before continuing to
                // sieve for more primes.
                yield PRIME_DELAY;

                // The sieve works by marking all multiples of the current prime
                // as composite.
                var j = i + i;
                while (j <= n) {
                    td = get(j);

                    // For composite numbers, store a set recording each factor
                    // in td.radical.
                    if (!td.hasOwnProperty('radical')) {
                        td.radical = new Set;
                    }
                    td.radical.add(i);

                    // We recompute the title each time to keep it fresh, so you
                    // can watch it grow as the animation progresses.
                    td.title = '' + [...td.radical];

                    // An earlier pass for a lower value of i may have already
                    // visited some of these numbers (e.g., 6 12 18 etc. for 2,
                    // prior to sieving out multiples of 3), so we test for an
                    // unmarked td again, to avoid re-doing work we've already
                    // done and delaying COMPOSITE_DELAY milliseconds.
                    if (!td.hasOwnProperty('isPrime')) {
                        td.isPrime = false;
                        td.style.color = COMPOSITE_COLOR;
                        yield COMPOSITE_DELAY;
                    }

                    j = j + i;  // continue to next multiple of i
                }
            }

            i = i + 1;
        }

        
        i = 2;
        while (i <= n) {
            td = get(i);

            
            if (td.isPrime && (td2 = get(2*i + 1)) != null && td2.isPrime) {
                td.style.color = isMersenne(i) ? MERSENNE_GERMAIN_COLOR : SOPHIE_GERMAIN_COLOR;
                yield PRIME_DELAY;
            }
            i = i + 1;
        }

        jAlert("Sieve process to find prime has ended");
    }

    // Write a one-line, color-coded legend telling what each text color means,
    // separated by a horizontal rule (<hr>) from the table.
    write('<span style="color:' + COMPOSITE_COLOR + '">Composite</span> | ' +
          '<span style="color:' + PRIME_COLOR + '">Prime</span>  ' +
          '<hr/>');

    // Write the table whose data we'll re-color to show the sieve's progress.
    table(MAXIMUM);

    // The sieve generator returns an object with a .next() method that we will
    // call to iterate over the steps of the sieve, using the window.setTimeout
    // function to delay between each color update so we can see things change
    // quickly, but not faster than the eye can follow.
    var generator = sieve(MAXIMUM);
    var stepCount = 0;

    function step() {
        stepCount = stepCount + 1;
        // The next line is commented out. Remove the leading two slashes to see what it does.
        //console.log('step ' + stepCount);

        // Call the generator's next() method to resume it where it left off and
        // find the next animation delay, if not done yet.
        var result = generator.next();
        if (!result.done) {
            // This flavor of setTimeout takes a function to call after waiting
            // the number of milliseconds given by the second parameter.
            setTimeout(step, result.value);
        }
    }

    // Call step once to kick off the animation. It will call itself indirectly
    // via setTimeout after delaying the small returned value.
	
	</script>

</div>


</body>

</html>

<%
}
%>