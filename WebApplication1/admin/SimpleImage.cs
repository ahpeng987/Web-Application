using System;
using System.Collections.Generic;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;

namespace WebApplication1.admin
{
    public class SimpleImage
    {
        private Bitmap source;

        public SimpleImage(Stream stream)
        {
            source = new Bitmap(stream);
        }

        public SimpleImage(string filename)
        {
            source = new Bitmap(filename);
        }

        public SimpleImage(Byte[] bytes)
        {
            source = (Bitmap)new ImageConverter().ConvertFrom(bytes);
        }

        public void SaveAs(string filename)
        {
            source.Save(filename, ImageFormat.Jpeg);
        }
    }
}