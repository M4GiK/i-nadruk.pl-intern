<style>
a.list-group-item {
    background-color: #fff;
    border: 1px solid #ddd;
    display: block;
    margin-bottom: -1px;
    padding: 5px 15px;
    position: relative;
}
</style>

<div class="list-group">
  <?php foreach ($categories as $category) { // foreach $categories?>
  <?php //echo '<pre>';var_dump($category['sub_cat']);die();?>
                <a href="<?php echo $category['href']; ?>" class="list-group-item 0-level-cat <?php echo ($category['category_id']==$cat_id)?'active':''?>"><?php echo $category['name']; ?></a>
                <?php if(isset($category['sub_cat'])){ //if($category['sub_cat'])?>
                            <?php if(isset($category['sub_cat']['category_id'])){?>
                                        <?php if(isset($category['sub_cat']['siblings'])){?>
                                            <?php foreach($category['sub_cat']['siblings'] as $sibling){?>
                                                <a href="<?php echo $sibling['href']; ?>" class="list-group-item fa fa-angle-left <?php echo ($sibling['category_id']==$cat_id)?'active':''?>">&nbsp;&nbsp;&nbsp;&nbsp; <?php echo $sibling['name']; ?></a>
                                            <?php }// end foreach sibling?>
                                        <?php }else{?>
                                            <a href="<?php echo $category['sub_cat']['href']; ?>" class="list-group-item fa fa-angle-left <?php echo ($category['sub_cat']['category_id']==$cat_id)?'active':''?>">&nbsp;&nbsp;<?php echo $category['sub_cat']['name']; ?></a>
                                        <?php }?>
                                    
                            <?php }?>
                            <?php if(isset($category['sub_cat']['sub_cat'])){ //if($category['sub_cat']['sub_cat'])?>
                                    <?php if(isset($category['sub_cat']['sub_cat']['siblings'])){?>
                                        <?php foreach($category['sub_cat']['sub_cat']['siblings'] as $sibling){?>
                                            <a href="<?php echo $sibling['href']; ?>" class="list-group-item fa fa-angle-left <?php echo ($sibling['category_id']==$cat_id)?'active':''?>">&nbsp;&nbsp;&nbsp;&nbsp; <?php echo $sibling['name']; ?></a>
                                        <?php }// end foreach sibling?>
                                    <?php }else{?>
                                        <a href="<?php echo $category['sub_cat']['sub_cat']['href']; ?>" class="list-group-item fa fa-angle-left <?php echo ($category['sub_cat']['sub_cat']['category_id']==$cat_id)?'active':''?>">&nbsp;&nbsp;&nbsp;&nbsp; <?php echo $category['sub_cat']['sub_cat']['name']; ?></a>
                                        <?php if (isset($category['sub_cat']['sub_cat']['children'])) {//if children?>
                                            <?php foreach ($category['sub_cat']['sub_cat']['children'] as $child) { //foreach child?>
                                                    <a href="<?php echo $child['href']; ?>" class="list-group-item fa fa-angle-left <?php echo ($child['category_id']==$cat_id)?'active':''?>">&nbsp;&nbsp;&nbsp;&nbsp; <?php echo $child['name']; ?></a>
                                                    <?php if (isset($child['children'])) { //if sub child?>
                                                    <?php foreach($child['children'] as $sub_child) { //if sub child?>
                                                        <a href="<?php echo $sub_child['href']; ?>" class="list-group-item fa fa-angle-left <?php echo ($sub_child['category_id']==$cat_id)?'active':''?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <?php echo $sub_child['name']; ?></a>
                                                     <?php } //end foreach sub child?>
                                                     <?php } //end if sub child?>
                                            <?php } // end foreach child?>
                                    <?php }?>
                                <?php }?>
                            <?php }else if (isset($category['sub_cat']['children'])) {//if children?>
                                        <?php foreach ($category['sub_cat']['children'] as $child) { //foreach child?>
                                                <a href="<?php echo $child['href']; ?>" class="list-group-item fa fa-angle-left <?php echo ($child['category_id']==$cat_id)?'active':''?>">&nbsp;&nbsp;&nbsp;&nbsp; <?php echo $child['name']; ?></a>
                                                <?php if (isset($child['children'])) { //if sub child?>
                                                <?php foreach($child['children'] as $sub_child) { //if sub child?>
                                                    <a href="<?php echo $sub_child['href']; ?>" class="list-group-item fa fa-angle-left <?php echo ($sub_child['category_id']==$cat_id)?'active':''?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <?php echo $sub_child['name']; ?></a>
                                                 <?php } //end foreach sub child?>
                                                 <?php } //end if sub child?>
                                        <?php } // end foreach child?>
                                <?php }  //end if children?>
                    
                <?php } //end if($category['sub_cat'])?>
                    <?php if (isset($category['children'])) { //if children?>
                                        <?php foreach ($category['children'] as $child) { //foreach child?>
                                                <a href="<?php echo $child['href']; ?>" class="list-group-item fa fa-angle-left <?php echo ($child['category_id']==$cat_id)?'active':''?>">&nbsp;&nbsp;&nbsp;&nbsp; <?php echo $child['name']; ?></a>
                                                <?php if (isset($child['children'])) { //if sub child?>
                                                    <?php foreach($child['children'] as $sub_child) { //if sub child?>
                                                        <a href="<?php echo $sub_child['href']; ?>" class="list-group-item fa fa-angle-left <?php echo ($sub_child['category_id']==$cat_id)?'active':''?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <?php echo $sub_child['name']; ?></a>
                                                     <?php } //end foreach sub child?>
                                                 <?php } //end if sub child?>        
                                        <?php } // end foreach child?>
                  <?php }  //end if children?>
  <?php } // end foreach $categories?>
</div>