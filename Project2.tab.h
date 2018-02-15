/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     IF_STATEMENT = 258,
     ELSE_STATEMENT = 259,
     THEN_STATEMENT = 260,
     RETURN_STATEMENT = 261,
     WHILE_STATEMENT = 262,
     WRITE_STATEMENT = 263,
     WRITELN_STATEMENT = 264,
     READ_STATEMENT = 265,
     BREAK_STATEMENT = 266,
     GREATER_COMPARISON = 267,
     GREATEREQ_COMPARISON = 268,
     LESS_COMPARISON = 269,
     LESSEQ_COMPARISON = 270,
     EQ_COMPARISON = 271,
     NOT_EQ_COMPARISON = 272,
     OR_COMPARISON = 273,
     AND_COMPARISON = 274,
     NOT_OPERATOR = 275,
     ADD_OPERATOR = 276,
     SUB_OPERATOR = 277,
     MULTIPLY_OPERATOR = 278,
     DIVIDE_OPERATOR = 279,
     EQUAL_OPERATOR = 280,
     COMMA_OPERATOR = 281,
     INT_TYPE = 282,
     CHAR_TYPE = 283,
     IDENTIFIER = 284,
     INTEGER = 285,
     FLOAT = 286,
     LEFTBRACE = 287,
     RIGHTBRACE = 288,
     LEFTPAR = 289,
     RIGHTPAR = 290,
     SQUARELEFTBRACKET = 291,
     SQUARERIGHTBRACKET = 292,
     NEXTLINE = 293
   };
#endif
/* Tokens.  */
#define IF_STATEMENT 258
#define ELSE_STATEMENT 259
#define THEN_STATEMENT 260
#define RETURN_STATEMENT 261
#define WHILE_STATEMENT 262
#define WRITE_STATEMENT 263
#define WRITELN_STATEMENT 264
#define READ_STATEMENT 265
#define BREAK_STATEMENT 266
#define GREATER_COMPARISON 267
#define GREATEREQ_COMPARISON 268
#define LESS_COMPARISON 269
#define LESSEQ_COMPARISON 270
#define EQ_COMPARISON 271
#define NOT_EQ_COMPARISON 272
#define OR_COMPARISON 273
#define AND_COMPARISON 274
#define NOT_OPERATOR 275
#define ADD_OPERATOR 276
#define SUB_OPERATOR 277
#define MULTIPLY_OPERATOR 278
#define DIVIDE_OPERATOR 279
#define EQUAL_OPERATOR 280
#define COMMA_OPERATOR 281
#define INT_TYPE 282
#define CHAR_TYPE 283
#define IDENTIFIER 284
#define INTEGER 285
#define FLOAT 286
#define LEFTBRACE 287
#define RIGHTBRACE 288
#define LEFTPAR 289
#define RIGHTPAR 290
#define SQUARELEFTBRACKET 291
#define SQUARERIGHTBRACKET 292
#define NEXTLINE 293




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 16 "Project2.y"
{
	int value;
	struct generateTree *operation;
}
/* Line 1529 of yacc.c.  */
#line 130 "Project2.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

