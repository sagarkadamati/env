#include <iostream>
#include <fstream>
#include <stack>
#include <stdio.h>
#include <podofo/podofo.h>

using namespace std;
using namespace PoDoFo;

// See PDF Reference, table, 4.1, "Operator categories".
// "m",     "MoveTo"
// "l",     "LineTo"
// "q",     "Save State"
// "Q",     "Restore State"
// "BT",    "Begin Text"
// "ET",    "End Text"
// "BDC",   "Begin marked content"
// "BMC",   "Begin marked content with property list"
// "EMC",   "End marked content"

// void PdfContentsGraph()
// {
// 	PdfContentsTokenizer contentsTokenizer;
// 	EPdfContentsType t;
// 	const char * kwText;
// 	PdfVariant var;
// 	bool readToken;

// 	int tokenNumber = 0;

// 	// Set up the node stack and initialize the root node
// 	stack<Vertex> parentage;
// 	parentage.push( add_vertex(m_graph) );
// 	m_graph[parentage.top()] = MakeNode(KW_RootNode,KW_RootNode);

// 	// Arguments to be associated with the next keyword found
// 	vector<PdfVariant> args;

// 	while ( ( readToken = contentsTokenizer.ReadNext(t, kwText, var) ) )
// 	{
// 		++tokenNumber;
// 		if (t == ePdfContentsType_Variant)
// 		{
// 			// arguments come before operators, but we want to group them up before
// 			// their operator.
// 			args.push_back(var);
// 		}
// 		else if (t == ePdfContentsType_Keyword)
// 		{
// 			const KWInfo & ki ( findKwByName(kwText) );
// 			if (ki.kt != KT_Closing)
// 			{
// 				// We're going to need a new vertex, so make sure we have one ready.
// 				Vertex v = add_vertex( m_graph );
// 				// Switch any waiting arguments into the new node's data.
// 				m_graph[v].first.GetArgs().swap( args );
// 				assert(!args.size());

// 				if (ki.kw == KW_Unknown)
// 				{
// 					// No idea what this keyword is. We have to assume it's an ordinary
// 					// one, possibly with arguments, and just push it in as a node at the
// 					// current level.
// 					assert(!m_graph[v].first.IsDefined());
// 					m_graph[v].first.SetKw( string(kwText) );
// 					add_edge( parentage.top(), v, m_graph );
// 					assert( m_graph[v].first.GetKwId() == ki.kw );
// 					assert( m_graph[v].first.GetKwString() == kwText );
// 				}
// 				else if (ki.kt == KT_Standalone)
// 				{
// 					// Plain operator, shove it in the newly reserved vertex (which might already contain
// 					// arguments) and add an edge from the top to it.
// 					assert(ki.kw != KW_Undefined && ki.kw != KW_Unknown && ki.kw != KW_RootNode );
// 					assert(!m_graph[v].first.IsDefined());
// 					m_graph[v].first.SetKw( ki.kw );
// 					add_edge( parentage.top(), v, m_graph );
// 					assert( m_graph[v].first.GetKwId() == ki.kw );
// 					assert( m_graph[v].first.GetKwString() == kwText );
// 				}
// 				else if (ki.kt == KT_Opening)
// 				{
// 					PrintStack(m_graph, parentage, "OS: ");
// 					assert(ki.kw != KW_Undefined && ki.kw != KW_Unknown && ki.kw != KW_RootNode );
// 					assert(!m_graph[v].first.IsDefined());
// 					m_graph[v].first.SetKw( ki.kw );
// 					// add an edge from the current top to it
// 					add_edge( parentage.top(), v, m_graph );
// 					// and push it to the top of the parentage stack
// 					parentage.push( v );
// 					assert( m_graph[v].first.GetKwId() == ki.kw );
// 					assert( m_graph[v].first.GetKwString() == kwText );
// 					PrintStack(m_graph, parentage, "OF: ");
// 				}
// 				else
// 				{
// 					assert(false);
// 				}
// 			}
// 			else if (ki.kt == KT_Closing)
// 			{
// 				// This keyword closes a context. The top of the parentage tree should
// 				// be a node whose KWInstance is the matching opening keyword. We'll check
// 				// that, then set the second KWInstance appropriately.
// 				PrintStack(m_graph, parentage, "CS: ");
// 				assert(ki.kw != KW_Undefined && ki.kw != KW_Unknown && ki.kw != KW_RootNode );
// 				// Get a reference to the node data for the current parent
// 				NodeData & n ( m_graph[parentage.top()] );
// 				PODOFO_RAISE_LOGIC_IF( n.second.IsDefined(), "Closing already closed group" );
// 				// Ensure that the opening keyword therein is one that this closing keyword is
// 				// a valid match for
// 				PdfContentStreamKeyword expectedCloseKw = n.first.GetKwInfo().kwClose;
// 				// Ensure there aren't any args to the close kw
// 				assert(!args.size());
// 				// and handle the close matching
// 				if ( ki.kw != expectedCloseKw )
// 				{
// 					// Some PDFs, even Adobe ones, place close operators
// 					// in the wrong order. We'll do some lookahead to see
// 					// if we can fix things up before we hit a non-close
// 					// operator.
// 					if ( !closeFixup( m_graph, parentage, contentsTokenizer, ki  ) )
// 					{
// 						string err = formatMismatchError(m_graph, parentage, tokenNumber, ki.kw, expectedCloseKw);
// 						PODOFO_RAISE_ERROR_INFO( ePdfError_InvalidContentStream, err.c_str() );
// 					}
// 				}
// 				else
// 				{
// 					n.second.SetKw( ki.kw );
// 					// Our associated operator is now on the top of the
// 					// parentage stack. Since its scope has ended, it should
// 					// also be popped.
// 					parentage.pop();
// 				}
// 				PrintStack(m_graph, parentage, "CF: ");
// 			}
// 			else
// 			{
// 				assert(false);
// 			}
// 		}
// 		else
// 		{
// 			assert(false);
// 		}
// 	}
// }

int exist() 
{
	return std::find(vector.begin(), vector.end(), item) != vector.end();
}

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

	double dCurPosX     = 0.0;
	double dCurPosY     = 0.0;

	double red          = 0.0;
	double green        = 0.0;
	double blue         = 0.0;

	double td_x        = 0.0;
	double td_y        = 0.0;

	double scale_x      = 0.0;
	double shear_x      = 0.0;
	double shear_y      = 0.0;
	double scale_y      = 0.0;
	double offset_x      = 0.0;
	double offset_y      = 0.0;

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
				dCurPosX = stack.top().GetReal();
				stack.pop();
				dCurPosY = stack.top().GetReal();
				stack.pop();
			}
			else if( strcmp( pszToken, "BT" ) == 0 ) 
			{
				bTextBlock   = true;     
				block << "BT" << endl;
				// BT does not reset font
				// pCurFont     = NULL;
			}
			else if( strcmp( pszToken, "ET" ) == 0 ) 
			{
				block << "ET" << endl;
				// if( !bTextBlock ) 
				// 	fprintf( stderr, "WARNING: Found ET without BT!\n" );
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

					// PdfName fontName = stack.top().GetName();
					// PdfObject* pFont = pPage->GetFromResources( PdfName("Font"), fontName );
					// if( !pFont ) 
					// {
					// 	cout << "Cannot create font!" << endl;
					// }

					// pCurFont = pDocument->GetFont( pFont );
					// if( !pCurFont ) 
					// {
					// 	fprintf( stderr, "WARNING: Unable to create font for object %i %i R\n",
					// 		 pFont->Reference().ObjectNumber(),
					// 		 pFont->Reference().GenerationNumber());
					// }
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
					// AddTextElement( dCurPosX, dCurPosY, pCurFont, stack.top().GetString() );
				        // block << "(" ;
					// if ( strcmp(stack.top().GetString().GetString(), "(") == 0 ||
					//      strcmp(stack.top().GetString().GetString(), ")") == 0)
					// 	block << "\\" ;
					str = stack.top().GetString().GetString();
					ReplaceStringInPlace(str, "\\", "\\\\");
					ReplaceStringInPlace(str, "(", "\\(");
					ReplaceStringInPlace(str, ")", "\\)");
		
					block << "(" << str << ")" << pszToken << endl;
					// cout << "(" << stack.top().GetString().GetString() << ")" << pszToken << endl;
					stack.pop();
				}
				else if( strcmp( pszToken, "\"" ) == 0 )
				{
					// AddTextElement( dCurPosX, dCurPosY, pCurFont, stack.top().GetString() );
					block << "Remove Char space: " << stack.top().GetString().GetString() << endl;
					stack.pop();
					stack.pop(); // remove char spacing from stack
					stack.pop(); // remove word spacing from stack
				}
				// else if( strcmp( pszToken, "TJ" ) == 0 ) 
				// {
				// 	PdfArray array = stack.top().GetArray();
				// 	stack.pop();
                    
				// 	for( int i=0; i<static_cast<int>(array.GetSize()); i++ ) 
				// 	{
				// 		if( array[i].IsString() || array[i].IsHexString() )
				// 			cout << array[i].GetString();
				// 	}
				// }
			}
		}
		else if ( eType == ePdfContentsType_Variant )
		{
			// if(var.IsString())
			// 	cout << var.GetString().GetString() << endl;
			
			// cout << pszToken << endl;
			
			stack.push( var );
		}
	}
	
	return block.str();
}
				
int main()
{
	int pn, pc;

	// PdfMemDocument pdf("/home/sagar/env/vedanta/bagavatham/original/Skandamu04.pdf");

	PdfMemDocument pdf("sample.pdf");
	PdfStreamedDocument pdfout("output.pdf");
	PdfPainter painter;
	PdfPage* pPage;
	PdfFont* pFont;

	PdfError::EnableDebug( false );

	pdfout.GetInfo()->SetCreator ( PdfString("examplahelloworld - A PoDoFo test application") );
	pdfout.GetInfo()->SetAuthor  ( PdfString("Dominik Seichter") );
	pdfout.GetInfo()->SetTitle   ( PdfString("Hello World") );
	pdfout.GetInfo()->SetSubject ( PdfString("Testing the PoDoFo PDF Library") );
	pdfout.GetInfo()->SetKeywords( PdfString("Test;PDF;Hello World;") );

	pdf.DeletePages(0, 1);
	pc = pdf.GetPageCount();

	for (pn = 0; pn < pc; ++pn) {
		PdfPage* page = pdf.GetPage(pn);
		PdfObject* contents = page->GetContents();
		PdfObject* resources = page->GetResources();
		PdfRect mediabox  = page->GetMediaBox();
		PdfContentsTokenizer tok(page);
		PdfVariant var;
		EPdfContentsType type;
		const char* token = NULL;

		PdfStream* stream;
		char*    pBuffer;
		pdf_long lLen;
		string str;

		ofstream modified;
		ofstream actual;
		modified.open("modified.txt");
		actual.open("actual.txt");

		cout << "Width: " << mediabox.GetWidth() << " Height: " << mediabox.GetHeight();
		str = extract(&pdf, page);

		if(contents->HasStream()) {
			stream = contents->GetStream();
			cout << " Has Stream, lenght: " << stream->GetLength() << endl;

			stream->GetFilteredCopy(&pBuffer, &lLen);
			actual << pBuffer;
			// stream->Set(pBuffer);
			free(pBuffer);
		}

		modified << str;
		contents->GetStream()->Set(str.c_str());

		actual.close();
		modified.close();
		system("diff -up actual.txt modified.txt | egrep '^\\+|^-' > diff.txt");

		system("pdftk modify.pdf output modify1.pdf uncompress");
		system("mv modify1.pdf modify.pdf");

		// if(resources->HasStream()) {
		// 	resources->GetStream()->GetFilteredCopy(&pBuffer, &lLen);
		// 	// cout << pBuffer;
		// 	free(pBuffer);
		// }

		// while (tok.ReadNext(type, token, var)) {
		// 	if (type == PoDoFo::ePdfContentsType_Keyword) {
		// 		// process type, token & var
		// 		string s(token);
		// 		string m("Tm");

		// 		if(!s.compare("\'"))
		// 			cout << token << " ";

		// 		if(!s.compare("Tm")) {
		// 			cout << token << " ";

		// 			if(var.IsNumber())
		// 				cout << var.GetNumber() << " ";

		// 			if(var.IsString())
		// 				cout << var.GetString().GetString();
				
		// 			if (var.IsArray()) {
		// 				PoDoFo::PdfArray& a = var.GetArray();
		// 				for (size_t i = 0; i < a.GetSize(); ++i)
		// 					if (a[i].IsNumber())
		// 						cout << var.GetNumber() << " ";
		// 			}

		// 			cout << endl;
		// 		}
				
		// 		if (token == "Tc" || token == "Tw" || token == "Tz" 
		// 		    || token == "TL" || token == "T*" || token == "Tr" || token == "Tm")
		// 		if(token == m)
		// 			cout << endl << token << endl;

		// 		if(var.IsString())
		// 			cout << var.GetString().GetString();
					
		// 		if(var.IsNumber())
		// 			cout << var.GetNumber() << " ";
				
		// 		if (var.IsArray()) {
		// 			PoDoFo::PdfArray& a = var.GetArray();
		// 			for (size_t i = 0; i < a.GetSize(); ++i)
		// 				if (a[i].IsString());
		// 					// do something with a[i].GetString()

			// if (type == ePdfContentsType_ImageData)
			// 	printf("%d", type);

			// if (type == PoDoFo::ePdfContentsType_Keyword) 
			// 	printf("%d", type);

			// if (type == PoDoFo::ePdfContentsType_Variant)
			// 	printf("%d", type);


		// 		}
		// 	}
		// }
			
		pPage = pdfout.CreatePage(page->GetPageSize());

		pFont = pdfout.CreateFont( "Arial" );
		pFont->SetFontSize( 18.0 );

		painter.SetPage( pPage );
		painter.SetFont( pFont );
		painter.DrawText( 56.69, pPage->GetPageSize().GetHeight() - 56.69, "Hello World!" );

		painter.FinishPage();
	}

	cout << endl;

	pdf.Write("modify.pdf");
	pdfout.Close();

	return 0;
}
