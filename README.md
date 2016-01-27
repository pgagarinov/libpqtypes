# libpqtypes

This is a fork of the official libpqtypes repository. 
The reason for creating this fork is a slow reaction from libpqtypes developers to newly found bugs. 

Change Log:

v 1.5.2a (most of the changes below are made by Dmitry Epstein)

 -	PQseterror (error.c) - an optimization.
 -	pqt_put_float4 (numerics.c) - looks like a fix for a non-standard syntax.
 -	pqt_get_numeric (numerics.c) - a fix for a method that returns Numeric in native format.
 -	strip_var (numerics.c) - a fix for an internal method that normalizes a string representation of a number.
 -	str2num (numerics.c) - adds NaN handling in an internal method used for putting numbers.
 -	num2str (numerics.c) - adds NaN handling in an internal method used for getting numbers.
 -	pqt_parse (spec.c) - a fix for a format string parser, something to do with custom handlers, IIRC.


v 1.5.2 (official unreleased version  -see http://libpqtypes.esilo.com/pkgdocs.html?file=ChangeLog)	
 
