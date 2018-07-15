public class aaPage72 {
    ApexPages.StandardSetController controller;
    public List<account> selectedAccounts {
    get {
    if (selectedAccounts == null) {
    selectedAccounts = (List<account>) controller.getSelected();
    GetMoreData();
    }
    return selectedAccounts;
    }
    set;
    }
    public aaPage72(ApexPages.StandardSetController controller) {
    this.controller = controller;
    }
    //public PageReference GoToList() {
   // return new PageReference('/001?fcf=00B800000079Wvt');
    //}
    public PageReference Navigate() {
    return new PageReference('/' + getAccountID());
    }
    public PageReference Submit() {
    // Create an approval request for the account
    Approval.ProcessSubmitRequest req1 = new Approval.ProcessSubmitRequest();
    req1.setComments('Submitting request for approval.');
    req1.setNextApproverIds(new Id[] {UserInfo.getUserId()});
    req1.setObjectId(getAccountID());
     
    // Submit the approval request for the account
    Approval.ProcessResult result = Approval.process(req1);
     
    // Verify the result
    System.assert(result.isSuccess());
     
    System.assertEquals('Pending', result.getInstanceStatus(), 'Instance Status'+result.getInstanceStatus());
    return null;
    }
    public PageReference Approve() {
    processApproval(true);
    return null;
    }
    public PageReference Reject() {
    processApproval(false);
    return null;
    }
    public void processApproval(Boolean isApproved) {
    // First, get the IDs for the WorkItems
    List<Id> newWorkItemIds = new List<Id>();
    for (List<ProcessInstance> pis : [Select (Select Id From Workitems) From ProcessInstance p WHERE p.TargetObjectId = :getAccountID() AND p.Status = 'Pending']) {
    for (ProcessInstance pi : pis) {
    for (List<ProcessInstanceWorkitem> wis : pi.Workitems) {
    for (ProcessInstanceWorkitem wi : wis ) {
    newWorkItemIds.add(wi.id);
    }
    }
    }
    }
     
    // Instantiate the new ProcessWorkitemRequest object and populate it
    Approval.ProcessWorkitemRequest req2 = new Approval.ProcessWorkitemRequest();
    if (isApproved) {
    req2.setComments('Approving request.');
    req2.setAction('Approve');
    } else {
    req2.setComments('Rejecting request.');
    req2.setAction('Reject');
    }
    req2.setNextApproverIds(new Id[] {UserInfo.getUserId()});
     
    // Use the ID from the newly created item to specify the item to be worked
    req2.setWorkitemId(newWorkItemIds.get(0));
     
    // Submit the request for approval
    Approval.ProcessResult result2 = Approval.process(req2);
     
    // Verify the results
    System.assert(result2.isSuccess(), 'Result Status:'+result2.isSuccess());
     
    if (isApproved) {
    System.assertEquals('Approved', result2.getInstanceStatus(), 'Instance Status'+result2.getInstanceStatus());
    } else {
    System.assertEquals('Rejected', result2.getInstanceStatus(), 'Instance Status'+result2.getInstanceStatus());
    }
    }
    public ID getAccountID() {
    return ApexPages.currentPage().getParameters().get('AccountID');
    }
    public void GetMoreData() {
    selectedAccounts = [SELECT id, name FROM account WHERE id IN :selectedAccounts];
    }
    }