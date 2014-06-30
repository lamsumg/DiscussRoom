using System;
using System.Collections.Generic;
using System.Drawing;
using System.Text;

namespace ImageCodeSourceCode
{
    //定义一个枚举，保存到流里
    public enum SaveTo
    {
        None,
        File,
        Stream
    }
    public class ImageCode
    {
        //字符长度
        private int Length { get; set; }
        //背景图
        private string BackImageFileName { get; set; }
        //保存位置
        private string FileName { get; set; }
        public System.IO.Stream Stream { get; set; }
        //保存到流里
        private void Save(string FileName)
        {
            if (string.IsNullOrEmpty(FileName))
            {
                throw new InvalidOperationException("未提供文件名来保存");
            }

            this.img.Save(FileName);

        }

        private void Save(System.IO.Stream stream)
        {
            if (stream == null)
            {
                throw new InvalidOperationException("未提供文件名来保存");
            }

            this.img.Save(stream, System.Drawing.Imaging.ImageFormat.Jpeg);

        }

        private List<char> chars = new List<char>();

        private ImageCode(string BackImageFileName, int Length)
        {
            this.BackImageFileName = BackImageFileName;
            this.Length = Length;
            for (char i = 'a'; i <= 'z'; i++)
            {

                this.chars.Add(i);

            }
            for (int i = 0; i < 10; i++)
            {
                this.chars.Add(char.Parse(i.ToString()));
            }

        }

        public ImageCode(string BackImageFileName, int Length, System.IO.Stream stream)
            : this(BackImageFileName, Length)
        {
            this.Stream = stream;
        }
        public ImageCode(string BackImageFileName, int Length, string FileName)
            : this(BackImageFileName, Length)
        {
            this.FileName = FileName;
        }
        private System.Drawing.Image img = null;

        private void DrawImage(string Code)
        {

            Font f = new Font("宋体", 20);

            //if (string.IsNullOrEmpty(this.BackImageFileName))
            //{
            //    this.img = new Bitmap(12*this.Length, 36);

            //}
            //else
            //{
            //    this.img = Image.FromFile(this.BackImageFileName);
            //    if (this.img.Width<this.Length*36 || this.img.Height<36)
            //    {
            //        this.img = new Bitmap(this.img, new Size(this.Length * 36, 36));

            //    }
            //}
            this.img = Image.FromFile(this.BackImageFileName);

            Graphics g = Graphics.FromImage(img);

            g.DrawString(Code, f, new System.Drawing.Drawing2D.LinearGradientBrush(new Point(0, 0), new Point(36, 36), Color.Yellow, Color.Red), new PointF(3, 3));

            g.Dispose();



        }

        public string GenerateCode(SaveTo enforceSave)
        {

            string s = "";
            //1.

            Random rnd = new Random();
            for (int i = 0; i < this.Length; i++)
            {
                s += chars[rnd.Next(this.chars.Count)].ToString();
            }
            //
            DrawImage(s);
            //2.
            switch (enforceSave)
            {
                case SaveTo.None:
                    break;
                case SaveTo.File:
                    this.Save(this.FileName);
                    break;
                case SaveTo.Stream:
                    this.Save(this.Stream);
                    break;
                default:
                    break;
            }
            return s;

        }


    }
}
