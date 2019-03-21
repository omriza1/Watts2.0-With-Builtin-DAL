using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using MySql.Data.MySqlClient;

namespace Watts2._0_With_Builtin_DAL.DAL
{
    public class MessageMethods
    {
        #region Select


        /// <summary>
        /// check if a message exists in the database
        /// </summary>
        /// <param name="content"></param>
        /// <returns></returns>
        public static DataTable searchMessage(string content)
        {
            string com = "select content from watts_private_messages where content = '" + content + "'";
            return dal.GetTable(com);
            //Console.WriteLine(dt.Rows[0]["content"].ToString()); ככה ניגשים לתוכן של התא בטבלה  
        }

        public static DataTable getPrivateMessages(int senderID, int receiverID)
        {
            string com = "select * from watts_private_messages where senderID=" + senderID + " and receiverID=" + receiverID + " or senderID=" + receiverID + " and receiverID=" + senderID + " ORDER BY Mdate ASC";
            return dal.GetTable(com);
        }
        #endregion

        #region Delete
        /// <summary>
        /// deletes a message from the database
        /// </summary>
        /// <param name="messageId"></param>
        public static void deleteMessage(int messageId)
        {
            string com = "DELETE  FROM watts_private_messages WHERE messageID=" + messageId;
            dal.Execute(com);
        }
        /*//deletes all messages from database
        public static void deleteMessageAll()
        {
            string com = "DELETE FROM watts_private_messages";
            dal.Execute(com);
        }
        */
        #endregion

        #region Update
        /// <summary>
        /// edits the content of a message
        /// </summary>
        /// <param name="messageId"></param>
        /// <param name="newContent"></param>
        public static void EditMessage(int messageId, string newContent)
        {
            string com = "update watts_private_message set content=" + newContent + " where messageID= " + messageId;
            dal.Execute(com);
        }
        #endregion

        #region Insert
        /// <summary>
        /// inserts a message to the database with the sender and the reciver of the message
        /// </summary>
        /// <param name="senderID"></param>
        /// <param name="content"></param>
        /// <param name="receiverID"></param>
        public static void SendMessagePrivate(int senderID, string content, int receiverID)
        {
            string com = "INSERT INTO watts_private_messages (senderID,content,receiverID,Mdate) VALUES (" + senderID + ",'" + content + "'," + receiverID + ",'" + DateTime.Now.ToString() + "')";
            dal.Execute(com);
        }
        #endregion

        #region not sql
        public static bool IsEmpty(string str)
        {
            bool empty = true;
            if (str.Length > 0)
            {
                for (int i = 0; i < str.Length; i++)
                {
                    if (str[i] == ' ')
                    {
                        ;
                    }
                }
            }
            return empty;
        }

        #endregion
    }
}