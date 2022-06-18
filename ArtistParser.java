import java.io.*;
import org.w3c.dom.*;
import org.xml.sax.SAXException;

import javax.xml.parsers.*;

public class ArtistParser
{
    public static void main(String[] args) throws ParserConfigurationException, IOException, SAXException {
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        Document document = builder.parse("artists_list.xml");
        Element root = document.getDocumentElement();
        NodeList children = root.getChildNodes();

        for (int i=0; i<children.getLength();i++)
        {
            Node actualNode = children.item(i);
            if (actualNode.getNodeType() == Node.ELEMENT_NODE)
            {
                Element element = (Element) actualNode;
                System.out.println(element.getAttribute("arid"));
            }

        }

    }
}
