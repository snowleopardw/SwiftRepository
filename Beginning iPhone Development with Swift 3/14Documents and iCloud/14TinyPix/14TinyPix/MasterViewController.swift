import  UIKit

class MasterViewController: UITableViewController {

    @IBOutlet var colorControl: UISegmentedControl!
    private var documentFileURLs: [URL] = []
    private var chosenDocument: TinyPixDocument?

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return documentFileURLs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FileCell")
        let fileURL = documentFileURLs[indexPath.row]
        do {
            try cell?.textLabel!.text = fileURL.deletingPathExtension().lastPathComponent
        } catch {
            print("Error is \(error)")
        }
        return cell!
    }

    private func urlForFileName(fileName: String) -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        var url: URL = URL(fileURLWithPath: "")

        url = urls.first!.appendingPathComponent(fileName)

        return url
    }

    private func reloadFiles() {
        let fm = FileManager.default
        let documentsURL = fm.urls(for:
            .documentDirectory, in: .userDomainMask).first!
        do {
            let fileURLs = try fm.contentsOfDirectory(at: documentsURL,
                                                      includingPropertiesForKeys: nil,
                                                      options: [])
            let sortedFileURLs = fileURLs.sorted(by: { (file1URL, file2URL) -> Bool in
                let attr1 = try! fm.attributesOfItem(atPath: file1URL.path)
                let attr2 = try! fm.attributesOfItem(atPath: file2URL.path)
                let file1Date = attr1[FileAttributeKey.creationDate] as! NSDate
                let file2Date = attr2[FileAttributeKey.creationDate] as! NSDate
                let result = file1Date.compare(file2Date as Date)
                return result == ComparisonResult.orderedAscending
            })
            documentFileURLs = sortedFileURLs
            tableView.reloadData()
        } catch {
            print("Error listing files in directory \(documentsURL.path): \(error)")
        } }


}
