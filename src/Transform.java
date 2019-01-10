
import javax.xml.transform.*;
import javax.xml.transform.stream.*;
import java.io.*;

/**
 * The Class Transform.
 */
public class Transform {
	
	/**
	 * The main method.
	 *
	 * @param args the arguments
	 */
	public static void main(String args[])
	{
//	String XSLFILE = "src/CS5200/xml/xslt/site2website.xsl";
//	String INFILE = "src/CS5200/xml/xslt/site.xml";
//	String OUTFILE = "src/CS5200/xml/xslt/website.xml";
		
//		String XSLFILE = "src/CS5200/xml/xslt/websiteXML2Html.xsl";
//		String INFILE = "src/CS5200/xml/xslt/website.xml";
//		String OUTFILE = "src/CS5200/xml/xslt/website.html";
			
		String XSLFILE = args[0];
		
		String INFILE = args[1];
		
		String OUTFILE = args[2];
		
	StreamSource xslcode = new StreamSource(new File(XSLFILE));
	StreamSource input = new StreamSource(new File(INFILE));
	StreamResult output = new StreamResult(new File(OUTFILE));
	
	TransformerFactory tf = TransformerFactory.newInstance();
				
		try
		
		{
			Transformer	trans = tf.newTransformer(xslcode);
			trans.transform(input, output);
		}
		
		catch(TransformerConfigurationException e)
		
		{
			e.printStackTrace();
		
		}
		
		catch(TransformerException c)
		{
			c.printStackTrace();
		}
}
}
