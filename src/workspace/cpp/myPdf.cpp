#include <iostream>
#include <podofo/podofo.h>

using namespace std;
using namespace PoDoFo;

int main()
{
	int pn, pc;

	PdfMemDocument pdf("mysample.pdf");
	PdfStreamedDocument pdfout("output.pdf");
	PdfPainter painter;
	PdfPage* pPage;
	PdfFont* pFont;

	pdfout.GetInfo()->SetCreator ( PdfString("examplahelloworld - A PoDoFo test application") );
	pdfout.GetInfo()->SetAuthor  ( PdfString("Dominik Seichter") );
	pdfout.GetInfo()->SetTitle   ( PdfString("Hello World") );
	pdfout.GetInfo()->SetSubject ( PdfString("Testing the PoDoFo PDF Library") );
	pdfout.GetInfo()->SetKeywords( PdfString("Test;PDF;Hello World;") );

	pc = pdf.GetPageCount();
	cout << "Pages: " << pc << endl;

	for (pn = 0; pn < pc; ++pn) {
		PdfPage* page = pdf.GetPage(pn);
		PdfContentsTokenizer tok(page);
		PdfVariant var;
		EPdfContentsType type;
		const char* token = NULL;

		while (tok.ReadNext(type, token, var)) {
			if (type == PoDoFo::ePdfContentsType_Keyword) {
				// process type, token & var
			}
		}

		pPage = pdfout.CreatePage(page->GetPageSize());

		pFont = pdfout.CreateFont( "Arial" );
		pFont->SetFontSize( 18.0 );

		painter.SetPage( pPage );
		painter.SetFont( pFont );
		painter.DrawText( 56.69, pPage->GetPageSize().GetHeight() - 56.69, "Hello World!" );

		painter.FinishPage();
	}

	pdfout.Close();

	return 0;
}
