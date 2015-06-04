#include <iostream>
#include <podofo/podofo.h>

using namespace std;
using namespace PoDoFo;

int main()
{
	PoDoFo::PdfMemDocument pdf("mysample.pdf");
	int pn, pc;

	pc = pdf.GetPageCount();
	cout << "Pages: " << pc << endl;

	// for (pn = 0; pn < pc; ++pn) {
	// 	PoDoFo::PdfPage* page = pdf.GetPage(pn);

	// 	PoDoFo::PdfContentsTokenizer tok(page);
	// 	const char* token = nullptr;
	// 	PoDoFo::PdfVariant var;
	// 	PoDoFo::EPdfContentsType type;
	// 	while (tok.ReadNext(type, token, var)) {
	// 		if (type == PoDoFo::ePdfContentsType_Keyword) {
	// 			// process type, token & var
	// 		}
	// 	}
	// }

	return 0;
}
