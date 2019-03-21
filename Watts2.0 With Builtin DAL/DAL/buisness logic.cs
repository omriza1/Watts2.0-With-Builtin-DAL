using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using MySql.Data.MySqlClient;

namespace Watts2._0_With_Builtin_DAL.DAL
{
    public class buisness_logic
    {
        #region Login screen
        public static bool Register(string username, string password)
        {
            //checks if the user does not exists, if he does not - true & if he does - false.
            if (!UserMethods.userExist(username) && password.Length > 6)
            {
                UserMethods.adduser(username, password);
                return true;
            }
            else
            {
                return false;
            }

        }

        public static bool login(string username, string password)
        {
            //checks if the user exists, if he does, true, and if not, false.
            if (UserMethods.userExist(username, password))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        #endregion

        #region Message

        public static void sendMessagePrivate(string sender, string content, string receiver)
        {
            if (UserMethods.userExist(sender) && UserMethods.userExist(receiver))
            {
                MessageMethods.SendMessagePrivate(UserMethods.getIDOfUser(sender), content, UserMethods.getIDOfUser(receiver));
            }
            else
            {
                if (!UserMethods.userExist(receiver))
                {
                    //replace with the function to display it on the web
                    Console.WriteLine("the receiver of the message does not exists");
                }
                if (MessageMethods.IsEmpty(content))
                {
                    //replace with the function to display it on the web
                    Console.WriteLine("the message is empty");
                }
            }
        }

        public static void searchMessage(string content)
        {
            //seacrhes for a message
            DataTable dt = MessageMethods.searchMessage(content);
            int x = dt.Rows.Count;
            if (x > 0)
            {
                for (int i = 0; i < x; i++)
                {
                    Console.WriteLine("Message " + (1 + i).ToString() + " :" + dt.Rows[i]["content"]);
                }
            }
            else
            {
                Console.WriteLine("No messages were found.");
            }
        }

        public static void deleteMessage(int messageID)
        {
            //deletes the message with the corosponding ID
            MessageMethods.deleteMessage(messageID);
        }

        public static void EditMessage(int messageID, string content)
        {
            //changes the content for a message
            MessageMethods.EditMessage(messageID, content);
        }

        public static void SendMessageGroup(int groupID, string content, int sender)
        {

            GroupMethods.sendMessage(sender, content, groupID);

        }
        #endregion

        #region User
        /// <summary>
        /// deletes the user
        /// </summary>
        /// <param name="username"></param>
        public static void deleteUser(string username)
        {
            UserMethods.deleteuser(username);
        }
        /// <summary>
        /// changes the password
        /// </summary>
        /// <param name="username"></param>
        /// <param name="password"></param>
        public static void changePassword(string username, string password)
        {
            UserMethods.ChangePassword(username, password);
        }

        /// <summary>
        /// searches for a user
        /// </summary>
        /// <param name="username"></param>
        /// <returns></returns>
        public static bool searchUser(string username)
        {
            if (UserMethods.userExist(username))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        /// <summary>
        ///checks if two users are friends
        /// </summary>
        /// <param name="friendA"></param>
        /// <param name="friendB"></param>
        /// <returns></returns>
        public static bool checkIfFriends(string friendA, string friendB)
        {
            if (UserMethods.userExist(friendB))
            {
                if (UserMethods.checkFriends(UserMethods.getIDOfUser(friendA), UserMethods.getIDOfUser(friendB)))
                {
                    //if they are return true
                    return true;
                }
                else
                {
                    //if they are not return false
                    return false;
                }
            }
            else
            {
                return false;
            }
        }
        #endregion

        #region Group Methods
        public static bool CreateGroup(string name, string adminUser)
        {
            if (!GroupMethods.groupExist(name))
            {
                GroupMethods.CreateGroup(name, UserMethods.getIDOfUser(adminUser));
                return true;
            }
            return false;
        }
        #endregion
    }
}