<%*
/* 
Author: TfTHacker - more info  https://tfthacker.com/
Date: 2023-12-06
Description: Adds a Tufte sidenotes to cssclasss to the current file. Part of the Cornell Notes Learning Vault https://tfthacker.com/cornell-notes.
LICENSE: Copyright © 2023 TfThacker (https://tfthacker.com/)  You are granted a non-exclusive, non-transferable, 
and non-sublicensable license to use and modify this file for your personal use only, and are prohibited from 
distributing, sublicensing, using for commercial purposes. This file remain the property of TfTHacker, and any unauthorized 
use or infringement will result in termination of this License. This file are provided "AS IS" without warranty of any kind, 
and the Licensor shall not be liable for any damages arising from the use or distribution of this file. By using this file, 
you acknowledge that you have read, understand, and agree to be bound by this License Agreement. 
*/

const setFrontMatter = async (file) => {
    await app.fileManager.processFrontMatter(file, (frontmatter) => {
        if (!frontmatter.cssclasses || !frontmatter.cssclasses.includes("tufte-sidenotes")) {
            if (!frontmatter.cssclasses) frontmatter.cssclasses = [];
            frontmatter.cssclasses.push("tufte-sidenotes");
        }
    });
}

const file = tp.file.find_tfile(tp.file.path(true));
setTimeout(async () => await setFrontMatter(file), 500); // Wait for the file to be created

%>
