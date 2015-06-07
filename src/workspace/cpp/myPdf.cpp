#include <iostream>
#include <fstream>
#include <stdio.h>
#include <stack>

#include <podofo/podofo.h>

using namespace std;
using namespace PoDoFo;

void ReplaceStringInPlace(std::string& subject, const std::string& search,
                          const std::string& replace) {
	size_t pos = 0;
	while ((pos = subject.find(search, pos)) != std::string::npos) {
		subject.replace(pos, search.length(), replace);
		pos += replace.length();
	}
}

std::string extract( PdfMemDocument* pDocument, PdfPage* pPage ) 
{
	const char*      pszToken = NULL;
	PdfVariant       var;
	EPdfContentsType eType;

	PdfContentsTokenizer tokenizer( pPage );

	double x            = 0.0;
	double y            = 0.0;

	double red          = 0.0;
	double green        = 0.0;
	double blue         = 0.0;

	double td_x         = 0.0;
	double td_y         = 0.0;

	double scale_x      = 0.0;
	double shear_x      = 0.0;
	double shear_y      = 0.0;
	double scale_y      = 0.0;
	double offset_x     = 0.0;
	double offset_y     = 0.0;

	double size;
	double g;
	string str;
	
	bool   bTextBlock   = false;
	PdfFont* pCurFont   = NULL;

	std::stack<PdfVariant> stack;
	std::ostringstream block;

	while( tokenizer.ReadNext( eType, pszToken, var ) )
	{
		if( eType == ePdfContentsType_Keyword )
		{
			if( strcmp( pszToken, "cm" ) == 0 ) 
			{
				offset_y = stack.top().GetReal();
				stack.pop();
				offset_x = stack.top().GetReal();
				stack.pop();
				scale_y  = stack.top().GetReal();
				stack.pop();
				shear_y  = stack.top().GetReal();
				stack.pop();
				shear_x  = stack.top().GetReal();
				stack.pop();
				scale_x  = stack.top().GetReal();
				stack.pop();
				
				block << scale_x << " " << shear_x << " " << shear_y
				      << " " << scale_y << " " << offset_x << " " << offset_y << " cm " << endl;
			}

			if( strcmp( pszToken, "q" ) == 0 ||
			    strcmp( pszToken, "Q" ) == 0 )
			{
				block << pszToken << endl;
			}

			if( strcmp( pszToken, "g" ) == 0 ||
			    strcmp( pszToken, "G" ) == 0 )
			{
				g = stack.top().GetReal();
				stack.pop();
				block << g << " " << pszToken << endl;
			}

			if( strcmp( pszToken, "rg" ) == 0 ||
			    strcmp( pszToken, "RG" ) == 0 )
			{
				blue = stack.top().GetReal();
				stack.pop();
				green = stack.top().GetReal();
				stack.pop();
				red = stack.top().GetReal();
				stack.pop();

				blue = 0.0;
				green = 0.0;
				red = 0.0;
				
				block << red << " " << green << " " << blue << " " << pszToken << endl;
			}

			// support 'l' and 'm' tokens
			if( strcmp( pszToken, "l" ) == 0 || 
			    strcmp( pszToken, "m" ) == 0 )
			{
				x = stack.top().GetReal();
				stack.pop();
				y = stack.top().GetReal();
				stack.pop();
			}
			else if( strcmp( pszToken, "BT" ) == 0 ) 
			{
				bTextBlock   = true;     
				block << "BT" << endl;
			}
			else if( strcmp( pszToken, "ET" ) == 0 ) 
			{
				block << "ET" << endl;
			}

			if( bTextBlock ) 
			{
				if( strcmp( pszToken, "gs" ) == 0 ) 
				{
					block << "/" << stack.top().GetName().GetName() << " " << "gs" << endl;
				}

				if( strcmp( pszToken, "Tf" ) == 0 ) 
				{
					size = stack.top().GetReal();
					stack.pop();
					block << "/" << stack.top().GetName().GetName() << " " << size << " " << "Tf" << endl;
				}

				if( strcmp( pszToken, "Tc" ) == 0 ||
				    strcmp( pszToken, "TL" ) == 0 ||
				    strcmp( pszToken, "Tw" ) == 0 )
				{
					td_y = stack.top().GetReal();
					stack.pop();
				
					block << td_y << " " << pszToken << endl;
				}

				if( strcmp( pszToken, "TD" ) == 0 ||
				    strcmp( pszToken, "Td" ) == 0)
				{
					td_y = stack.top().GetReal();
					stack.pop();
					td_x = stack.top().GetReal();
					stack.pop();
				
					block << td_x << " " << td_y << " " << pszToken << endl;
				}
				else if( strcmp( pszToken, "Tm" ) == 0 ) 
				{
					offset_y = stack.top().GetReal();
					stack.pop();
					offset_x = stack.top().GetReal();
					stack.pop();
					scale_y  = stack.top().GetReal();
					stack.pop();
					shear_y  = stack.top().GetReal();
					stack.pop();
					shear_x  = stack.top().GetReal();
					stack.pop();
					scale_x  = stack.top().GetReal();
					stack.pop();
				
					block << scale_x << " " << shear_x << " " << shear_y
					      << " " << scale_y << " " << offset_x << " " << offset_y << " Tm" << endl;
				}
				else if( strcmp( pszToken, "Tj" ) == 0 ||
					 strcmp( pszToken, "'" ) == 0 ) 
				{
					str = stack.top().GetString().GetString();
					ReplaceStringInPlace(str, "\\", "\\\\");
					ReplaceStringInPlace(str, "(", "\\(");
					ReplaceStringInPlace(str, ")", "\\)");
		
					block << "(" << str << ")" << pszToken << endl;
					// cout << "(" << stack.top().GetString().GetString() << ")" << pszToken << endl;
					stack.pop();
				}
			}
		}
		else if ( eType == ePdfContentsType_Variant )
		{
			stack.push( var );
		}
	}
	
	return block.str();
}

char glimps[1024];
int size = 0;
int is_exist(char ch)
{
	for(int i = 0; i < size; i++) {
		if(glimps[i] == ch)
			return 1;
	}

	return 0;
}

std::string process_glimps()
{
	std::ostringstream block;
	int x = 0, y = 800;

	block << "q" << endl;
	block << "0 0 1 rg" << endl;
	block << "0.99999 0 0 -1 951 67 Tm" << endl;
	block << "BT" << endl;
	block << "/R7 30 Tf" << endl;

	for(int i = 0; i < size; i++) {
		if(!(x % 450)) {
			x = 30;
			y -= 40;
		}
		else
			x += 30;

		block << "1 0 0 1 " << x << " " << y << " Tm" << endl;
		if(glimps[i] == '(')
			block << "(\()Tj" << endl;
		else if(glimps[i] == ')')
			block << "(\\))Tj" << endl;
		else if(glimps[i] == '\\')
			block << "(\\\\)Tj" << endl;
		else
			block << "(" << glimps[i] << ")Tj" << endl;

		// cout << "hi: " << x << endl;
		// y++;
	}

	block << "ET" << endl;
	block << "Q";

	return block.str();
}

void process_char( PdfMemDocument* pDocument, PdfPage* pPage ) 
{
	const char*          pszToken = NULL;
	PdfVariant           var;
	EPdfContentsType     eType;
	string               str;
	char                 ch;

	PdfContentsTokenizer tokenizer( pPage );
	
	while( tokenizer.ReadNext( eType, pszToken, var ) )
	{
		if( eType == ePdfContentsType_Keyword )
		{
			if( strcmp( pszToken, "Tj" ) == 0 ||
			    strcmp( pszToken, "'" ) == 0 ) 
			{
				str = var.GetString().GetString();
				
				for (int i = 0; i < str.size(); i++) {
					ch = str.at(i);
					if(!is_exist(ch)) {
						// cout << ch << " ";
						glimps[size++] = ch;
					}
				}
			}
		}
	}
}
				
int main()
{
	int pn, pc;

	// PdfMemDocument pdf("/home/sagar/Downloads/Skandamu01.pdf");

	PdfMemDocument pdf("mysample.pdf");

	PdfPage*       page = pdf.GetPage(0);
	PdfObject*     contents = page->GetContents();
	PdfObject*     resources = page->GetResources();
	// PdfStream*     stream = contents->GetStream();
	PdfRect        mediabox = page->GetMediaBox();

	char*          pBuffer;
	pdf_long       lLen;
	string         str;

	PdfError::EnableDebug( false );

	pc = pdf.GetPageCount();
	for (pn = 1; pn < pc; ++pn) {
		PdfPage*        page = pdf.GetPage(pn);		

		process_char(&pdf, page);
		// str = extract(&pdf, page);
	}

	// page->GetContents()->GetStream()->Set(process_glimps().c_str());

	pdf.Write("modify.pdf");
	cout << "Total: " << size;
	cout << endl;

	return 0;
}
